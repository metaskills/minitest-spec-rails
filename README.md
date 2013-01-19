
<img src="http://cdn.metaskills.net/minitest-spec-rails.png" width="233" height="154" />

# Make Rails Use MiniTest::Spec!


Rails 4 was on its way to using MiniTest::Spec as the superclass for ActiveSupport::TestCase. But in one of many reversals, the work was [pulled by this commit](http://github.com/rails/rails/commit/b22c527e65a41da59dbfcb078968069c6fae5086). DHH says that [Rails is omakase](http://david.heinemeierhansson.com/2012/rails-is-omakase.html) and I am cool with that. But since Ruby is wide open for us to change it and we are free in DHH's words to "freedom patch" what we see fit, we can fix Rails.

The minitest-spec-rails gem makes it easy to use the MiniTest::Spec DSL within your existing Rails 3 or 4 test suite. It does this by forcing ActiveSupport::TestCase to subclass MiniTest::Spec.

[![Build Status](https://secure.travis-ci.org/metaskills/minitest-spec-rails.png)](http://travis-ci.org/metaskills/minitest-spec-rails)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/metaskills/minitest-spec-rails)


## Usage

Existing or new Rails 3 or 4 applications that use the default Rails testing structure can simply drop in the minitest-spec-gem and start writing their tests in the new spec DSL. Since MinitTest::Spec is built on top of MiniTest::Unit, a replacement for Test::Unit, all of your existing tests will continue to work.

This gem uses no generators and does not require you to write your tests in a new directory or file structure. It is completely different than [minitest-rails](https://github.com/blowmage/minitest-rails) which is setup more like RSpec in the way it bolts on the side of Rails. The goal of this project is to make Rails 3 or 4 applications just work as if rails-core had decided to support MiniTest::Spec. Eventually that day will come and if it does, all your tests will still work! So bundle up and get started!

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

All existing Rails test cases that subclass ActiveSupport::TestCase will continue to work and I personally suggest that you  still use what I call the subclass convention vs the outer describe test case convention. However either will work.

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

