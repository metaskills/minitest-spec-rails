# MiniTest::Spec For Rails


This gem makes it easy to use the MiniTest Spec DSL in Rails 3 application tests.


# Example Gemfile

    group :test do
      gem 'minitest-spec-rails'
    end

# Example Model Test

    # ./test/unit/post_test.rb
    require 'test_helper'
    describe Post do
      it "must be valid" do
        @post.must_be :valid?
      end
    end

# Example Controller Test

    # ./test/functional/posts_controller_test.rb
    require 'test_helper'
    describe PostController do
      describe "on GET to :show" do
        before do
          get :show, id: "1"
        end

        it "returns a post object " do
          must_respond_with :success
          post = assigns(:post)
          post.wont_be_nil
        end
      end
    end

# Example Integration Test

    # ./test/integration/posts_integration_test.rb
    require 'test_helper'

    describe "Posts Integration Test" do
      describe "on GET to :show" do
        it "shows post" do
          visit post_path(@post)
          page.current_url.must_include("/posts/#{@post.id.to_s}")
          page.must_have_content "lorem ipsum post test"
        end
      end
    end
  end

# Example Run

    $ ruby -Itest test/unit/post_test.rb
    ...
    PostTest
      PASS test_0001_must_be_valid (0:00:00.002)
    ...


# Advantages

With minitest-spec-rails, we have a working solution by replacing MiniTest::Spec as the superclass for ActiveSupport::TestCase. This solution is simple and does not require you to recreate a new test case in your test_helper.rb or to use generators supplied by gems like minitest-rails.

MinitTest::Spec is built on top of MiniTest::Unit which a replacement for Test::Unit, so is stable and consistent.

It's easy to change an existing Rails application from Test Unit to  MiniTest::Spec simply installing this gem.

As Rails evolves to leverage MiniTest::Spec, your test case code will not have to change.


# How it works


This gem makes Test::Unit::TestCase a subclass of of MiniTest::Spec with a simple shim.

The gem tricks ActiveSupport::TestCase to use MiniTest::Spec instead. The gem includes any monkey patches to make using MiniTest::Spec a drop in behavior change for any Rails 3.x project.

Full Details here:

http://metaskills.net/2011/03/26/using-minitest-spec-with-rails/


# Styles


This <a href="http://cheat.errtheblog.com/s/minitest/1">cheat sheet</a> shows the Test Unit assert methods and the MiniTest::Spec methods.

Test Unit style:

    assert_equal 100, foo

MiniTest::Spec style:

    foo.must_equal 100


# Gotchas

There are a few missing assertions available in Test::Unit that are changed or no longer available in MiniTest.

  * The method <code>assert_raise</code> is renamed <code>assert_raises</code>.

  * There is no method <code>assert_nothing_raised</code>. There are good reasons for this on Ryan's blog.


# Issues

If there are any issues using this in Rails 3 outside the normal few assertions that change from Test::Unit to MiniTest::Unit, please open an issue here on github.


