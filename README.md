
<img src="http://cdn.metaskills.net/minitest-spec-rails.png" width="233" height="154" />

# Make Rails Use MiniTest::Spec!


The minitest-spec-rails gem makes it easy to use the MiniTest::Spec DSL within your existing Rails 2.3, 3.x or 4.x test suite. It does this by forcing ActiveSupport::TestCase to utilize the MiniTest::Spec::DSL.

[![Gem Version](https://badge.fury.io/rb/minitest-spec-rails.png)](http://badge.fury.io/rb/minitest-spec-rails)
[![Build Status](https://secure.travis-ci.org/metaskills/minitest-spec-rails.png)](http://travis-ci.org/metaskills/minitest-spec-rails)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/metaskills/minitest-spec-rails)


## Usage

Existing or new Rails applications that use the default Rails testing structure can simply drop in the minitest-spec-gem and start writing their tests in the new spec DSL. Since MinitTest::Spec is built on top of MiniTest::Unit, a replacement for Test::Unit, all of your existing tests will continue to work.


#### For Rails 3 or 4

```ruby
group :test do
  gem 'minitest-spec-rails'
end
```

#### For Rails 2.3

Our [2-3-stable](https://github.com/metaskills/minitest-spec-rails/tree/2-3-stable) branch tracks our 3.1 version number and is guaranteed to work on any Rails 2.3 version. Since Rails 2.3 does not have a configurable Railtie, we have enabled the [mini-shoulda](#mini_shoulda) option all the time. This means that if you are on Rails 2.3 under either Ruby 1.8 or 1.9, perhaps using Shoulda, you have a solid upgrade path! Get your tests running with minitest-spec-rails first and nothing in you test stack changes along the way!

```ruby
group :test do
  gem 'minitest-spec-rails', '~> 3.1'
end
```

#### Ruby 1.8 Users!!!

If you are using Ruby 1.8, you must install a Test::Unit shim that subclasses MiniTest::Unit, just as Ruby 1.9 does. We have kindly packed up Ruby 1.9's `lib/test` directory in the [minitest-spec-rails-tu-shim](https://github.com/metaskills/minitest-spec-rails-tu-shim) gem. So just add this to your Gemfile.

```ruby
group :test do
  gem 'minitest-spec-rails-tu-shim'
end
```


### How is this different than MiniTest::Rails?

To start off both Mike Moore (@blowmage) and I have worked together and we both LOVE MiniTest::Spec. Both projects aim to advocate MiniTest and make Rails integration as easy as possible. However, there are a few key differences in our projects. Some of these differences may go away in time too. As always, choose the tool you think fits your needs. So how, is minitest-spec-rails different than [minitest-rails](https://github.com/blowmage/minitest-rails)?

  * We aim to leverage existing Rails test directories and files!
  * No special test helper and/or generators.
  * Easy migration path for existing Rails applications.
  * How we go about freedom patching Rails.
  * Fully support Ruby 1.8.7 with all legacy Test::Unit behavior.
  * Compatability with ActiveSupport::TestCase's setup and teardowns.

So the goal of this project is to make Rails 3 or 4 applications just work as if rails-core had decided to support MiniTest::Spec all along. We believe that eventually that day will come and when it does, all your tests will still work! So bundle up and get started!

```ruby
gem 'minitest-spec-rails'
```


## Test Styles

This <a href="http://cheat.errtheblog.com/s/minitest">cheat sheet</a> shows both the MiniTest::Unit assertions along with the MiniTest::Spec assertion syntax. Remember, MiniTest::Spec is build on top of MiniTest::Unit which is a Test::Unit replacement. That means you can mix and match styles as you upgrade from Test::Unit to a more modern style. For example, both of these would work in MiniTest::Spec and are interchangeable.

```ruby
# MiniTest::Unit Assertion Style:
assert_equal 100, foo

# MiniTest::Spec Assertion Style:
foo.must_equal 100
```

All existing Rails test cases that subclass ActiveSupport::TestCase will continue to work and I personally suggest that you still **use the subclass convention** vs the outer describe test case convention. However either will work.

```ruby
require 'test_helper'
class UserTest < ActiveSupport::TestCase
  let(:user_ken)   { User.create! :email => 'ken@metaskills.net' }
  it 'works' do
    user_ken.must_be_instance_of User
  end
end
```

```ruby
require 'test_helper'
describe User do
  # This will work too.
end
```

Just for reference, here is a full list of each of Rails test case classes and the matching describe alternative if one exists. Remember, names are important when using the describe syntax. So you can not have a mailer named `FooBar` and expect it to work with the outer describe spec style since there is no way to map the spec type based on an existing naming convention.

```ruby
# Model Test
class UserTest < ActiveSupport::TestCase
end
describe User do
end

# Controller Test
class UsersControllerTest < ActionController::TestCase
end
describe UsersController do
end

# Integration Tests - Must use subclass style!
class IntegrationTest < ActionDispatch::IntegrationTest
end

# Mailer Test
class UserMailerTest < ActionMailer::TestCase
end
describe UserMailer do
end

# View Helper Test
class UsersHelperTest < ActionView::TestCase
end
describe UsersHelper do
end
```


## Extras

We have baked in a few extra methods behind the scenes to minitest-spec-rails. Most directly support our needs to reflect on described classes, however, they may be useful to you too when meta-programming on top of minitest-spec-rails.

### #described_class
The `described_class` method is available both via a class method and an instance method in any Rails test case. It is guaranteed to work despite the described level too. This allows class level macros to be build, much like Shoulda. Remember, it can only do this if you follow Rails naming conventions for your tests.

```ruby
class UserTest < ActiveSupport::TestCase
  described_class # => User(id: integer, email: string)
  it 'works here' do
    described_class # => User(id: integer, email: string)
  end
  describe 'and' do
    it 'works here too' do
      described_class # => User(id: integer, email: string)
    end
  end
end
```

### Setup & Teardown Compatability

Rails ActiveSupport::TestCase allows multiple setup and teardown methods per class. It also allows you to specify these either with a symbol or a block. Unlike normal ActiveSupport setup and teardown callbacks, our blocks are evaluated in the scope of the instance, just like before and after. So this just works!

```ruby
class ActiveSupportCallbackTest < ActiveSupport::TestCase
 
  setup :foo
  setup :bar
  before { @bat = 'biz' }
 
  it 'works' do
    @foo.must_equal 'foo'
    @bar.must_equal 'bar'
    @bat.must_equal 'biz'
  end
 
  private
 
  def foo ; @foo = 'foo' ; end
  def bar ; @bar = 'bar' ; end
 
end
```

### mini_shoulda

If you are migrating away from Shoulda, then minitest-spec-rails' mini_shoulda feature will help. To enable it, set the following configuration in your test environment file.

```ruby
# In config/environments/test.rb
config.minitest_spec_rails.mini_shoulda = true
```

Doing so only enables a few aliases that allow the Shoulda `context`, `should`, and `should_eventually` methods. The following code demonstrates the full features of the mini_shoulda implementation. It basically replaces the shell of [should-context](https://github.com/thoughtbot/shoulda-context) in a few lines of code.

```ruby
class PostTests < ActiveSupport::TestCase
  setup    { @post = Post.create! :title => 'Test Title', :body => 'Test body' }
  teardown { Post.delete_all }
  should 'work' do
    @post.must_be_instance_of Post
  end
  context 'with a user' do
    should_eventually 'have a user' do
      # ...
    end
  end
end
```

If you are in the assertions provided by shoulda-context like `assert_same_elements`, then you may want to consider copying them [from here](https://github.com/thoughtbot/shoulda-context/blob/master/lib/shoulda/context/assertions.rb) and including them in `MiniTest::Spec` yourself. I personally recommend just replacing these assertions with something more modern. A few examples are below.

```ruby
assert_same_elements a, b  # From
a.sort.must_equal b.sort   # To

assert_does_not_contain a, b  # From
a.wont_include b              # To
```

### Matchers

**I highly suggest that you stay away from matchers** since MiniTest::Spec gives you all the tools you need to write good tests. Staying away from matchers will make your code's tests live longer. So my advice is to stay away from things like `.should ==` and just write `.must_equal` instead. However, if matchers are really your thing, I recommend the [minitest-matchers](https://github.com/zenspider/minitest-matchers) gem. You can also check out the [valid_attribute](https://github.com/bcardarella/valid_attribute) gem built on top of minitest-matchers.

```ruby
describe Post do
  subject { Post.new }
  it { must have_valid(:title).when("Hello") }
  it { wont have_valid(:title).when("", nil, "Bad") }
end
```


## Gotchas

### Assertion Methods

If you are upgrading from Test::Unit, there are a few missing assertions that have been renamed or are no longer available within MiniTest.

* The method `assert_raise` is renamed `assert_raises`.
* There is no method `assert_nothing_raised`. There are good reasons for this on [Ryan's blog entry](http://blog.zenspider.com/blog/2012/01/assert_nothing_tested.html).

### Mocha

If you are using [Mocha](https://github.com/freerange/mocha) for mocking and stubbing, please update to the latest, 0.13.1 or higher so it is compatible with the latest MiniTest. If you do not like the deprecation warnings in older versions of Rails, just add this below the `require 'rails/all'` within your `application.rb` file :)

```ruby
require 'mocha/deprecation'
Mocha::Deprecation.mode = :disabled
```

### Rails 3.0.x

If you are using minitest-spec-rails with Rails 3.0, then your controller and mailer tests will need to use the `tests` interface for the assertions to be setup correctly within sub `describe` blocks. I think this is a bug with `class_attribute` within Rails 3.0 only. So use the following patterns.

```ruby
class UsersControllerTest < ActionController::TestCase
  tests UsersController
end
class UserMailerTest < ActionMailer::TestCase
  tests UserMailer
end
```


## Contributing

The minitest-spec-rails gem is fully tested from Rails 3.0 to 4 and upward. We run our tests on [Travis CI](http://travis-ci.org/metaskills/minitest-spec-rails) in both Ruby 1.8 and 1.9. If you detect a problem, open up a github issue or fork the repo and help out. After you fork or clone the repository, the following commands will get you up and running on the test suite. 

```shell
$ bundle install
$ bundle exec rake appraisal:setup
$ bundle exec rake appraisal test
```

We use the [appraisal](https://github.com/thoughtbot/appraisal) gem from Thoughtbot to help us generate the individual gemfiles for each Rails version and to run the tests locally against each generated Gemfile. The `rake appraisal test` command actually runs our test suite against all Rails versions in our `Appraisal` file. If you want to run the tests for a specific Rails version, use `rake -T` for a list. For example, the following command will run the tests for Rails 3.2 only.

```shell
$ bundle exec rake appraisal:rails32 test
```

Our current build status is:
[![Build Status](https://secure.travis-ci.org/metaskills/minitest-spec-rails.png)](http://travis-ci.org/metaskills/minitest-spec-rails)

