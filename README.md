# MiniTest::Spec For Rails 3 or 4.

This gem makes it easy to use the MiniTest Spec DSL within your existing Rails 3 or 4 application tests.

[![Build Status](https://secure.travis-ci.org/metaskills/minitest-spec-rails.png)](http://travis-ci.org/metaskills/minitest-spec-rails)


## Advantages

With minitest-spec-rails, we have a working solution by replacing MiniTest::Spec as the superclass for ActiveSupport::TestCase. This solution is simple and does not require you to recreate a new test case in your test_helper.rb or to use generators supplied by gems like minitest-rails.

MinitTest::Spec is built on top of MiniTest::Unit, a replacement for Test::Unit, so it is stable and consistent. It's easy to change an existing Rails application from Test::Unit/MiniTest::Unit to MiniTest::Spec by simply installing this gem. As Rails evolves to leverage MiniTest::Spec [(if ever)](http://github.com/rails/rails/commit/b22c527e65a41da59dbfcb078968069c6fae5086), your test case code will not have to change at both the class definition and internals.


## How it works

This gem makes Test::Unit::TestCase a subclass of of MiniTest::Spec with a simple shim. The gem tricks ActiveSupport::TestCase to use MiniTest::Spec instead. The gem includes any monkey patches to make using MiniTest::Spec a drop in behavior change for any Rails 3.x project.

Full Details here:

http://metaskills.net/2011/03/26/using-minitest-spec-with-rails/

## Styles

This <a href="http://cheat.errtheblog.com/s/minitest/1">cheat sheet</a> shows the Test::Unit assert methods and the MiniTest::Spec methods. Remember, MiniTest::Spec is build on top of MiniTest::Unit which is a Test::Unit replacement. That means you can mix and match styles as you upgrade from Test::Unit to a more modern style.

Test::Unit Style:

```ruby
assert_equal 100, foo
```

MiniTest::Spec Style:

```ruby
foo.must_equal 100
```

## Gotchas

If you are upgrading from Test::Unit, there are a few missing assertions that are changed or no longer available in MiniTest.

* The method `assert_raise` is renamed `assert_raises`.
* There is no method `assert_nothing_raised`. There are good reasons for this on [Ryan's blog entry](http://blog.zenspider.com/blog/2012/01/assert_nothing_tested.html).

If you are using minitest-spec-rails with Rails 3.0, then your controller or mailer tests will need to use the `tests` interface for the test to be setup correct within sub `describe` blocks. I think this is a bug with `class_attribute` within Rails 3.0. Rails 3.1 and higher does not exhibit this problem.


## Testing

After cloning the repository. Running the following commands will install all the dependencies and run tests for each appraisal gemfile and Rails version.

```shell
$ bundle install
$ bundle exec rake appraisal:setup
$ bundle exec rake appraisal test
```

If you want to run the tests for a specific Rails version, use `rake -T` for a list. For example, the following command will run the tests for Rails 3.2 only.

```shell
$ bundle exec rake appraisal:rails32 test
```

[![Build Status](https://secure.travis-ci.org/metaskills/minitest-spec-rails.png)](http://travis-ci.org/metaskills/minitest-spec-rails)


## Issues

If there are any issues past the gotchas mentioned above, please open an issue here on github.

