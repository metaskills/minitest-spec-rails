# MiniTest::Spec For Rails

This gem makes it easy to use the MiniTest Spec DSL in Rails 3 application tests.

# Advantages

With minitest-spec-rails, we have a working solution by replacing MiniTest::Spec as the superclass for ActiveSupport::TestCase. This solution is simple and does not require you to recreate a new test case in your test_helper.rb or to use generators supplied by gems like minitest-rails.

MinitTest::Spec is built on top of MiniTest::Unit which a replacement for Test::Unit, so is stable and consistent. It's easy to change an existing Rails application from Test Unit to MiniTest::Spec simply installing this gem. As Rails evolves to leverage MiniTest::Spec, your test case code will not have to change at both the class definition and internals. 

# How it works

This gem makes Test::Unit::TestCase a subclass of of MiniTest::Spec with a simple shim. The gem tricks ActiveSupport::TestCase to use MiniTest::Spec instead. The gem includes any monkey patches to make using MiniTest::Spec a drop in behavior change for any Rails 3.x project.

Full Details here:

http://metaskills.net/2011/03/26/using-minitest-spec-with-rails/

# Styles

This <a href="http://cheat.errtheblog.com/s/minitest/1">cheat sheet</a> shows the Test::Unit assert methods and the MiniTest::Spec methods. Remember, MiniTest::Spec is build on top of MiniTest::Unit which is a Test::Unit replacement. That means you can mix and match styles as you upgrade from Test::Unit to a more modern style.

Test::Unit Style:

    assert_equal 100, foo

MiniTest::Spec Style:

    foo.must_equal 100

There are a few missing assertions available in Test::Unit that are changed or no longer available in MiniTest.

  * The method <code>assert_raise</code> is renamed <code>assert_raises</code>.
  * There is no method <code>assert_nothing_raised</code>. There are good reasons for this on Ryan's blog.

# Alternate MiniTest::Spec Describe

It is also possible to change the style of your test files and their super classes. In these examples below, the gem will take care of setting your super class and proper setups.

    # ./test/unit/post_test.rb
    require 'test_helper'
    describe Post do
      it "must be valid" do
        @post.must_be :valid?
      end
    end

    # ./test/functional/posts_controller_test.rb
    require 'test_helper'
    describe PostController do
      describe "on GET to :show" do
        before do
          get :show, id: "1"
        end
        it "returns a post object " do
          post = assigns(:post)
          post.wont_be_nil
        end
      end
    end

# Issues

If there are any issues using this in Rails 3 outside the normal few assertions that change from Test::Unit to MiniTest::Unit, please open an issue here on github.


