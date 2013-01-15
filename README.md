# MiniTest::Spec For Rails

This gem makes it easy to use the MiniTest Spec DSL within your existing Rails 3 or 4 application tests.


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

There are a few missing assertions available in Test::Unit that are changed or no longer available in MiniTest.

  * The method `assert_raise` is renamed `assert_raises`.
  * There is no method `assert_nothing_raised`. There are good reasons for this on [Ryan's blog entry](http://blog.zenspider.com/blog/2012/01/assert_nothing_tested.html).


## Issues

If there are any issues using this in Rails 3 outside the normal few assertions that change from Test::Unit to MiniTest::Unit, please open an issue here on github.


