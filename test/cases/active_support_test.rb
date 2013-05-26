require 'test_helper'

class SomeRandomModel < ActiveRecord::Base; end

class ActiveSupportTest < MiniTestSpecRails::TestCase

  it 'resolves spec type for active record constants' do
    assert_support MiniTest::Spec.spec_type(SomeRandomModel)
    assert_support MiniTest::Spec.spec_type(User)
  end

  it 'wont resolve spec type for random strings' do
    assert_spec MiniTest::Spec.spec_type("Unmatched String")
  end

  private

  def assert_support(actual)
    assert_equal ActiveSupport::TestCase, actual
  end

  def assert_spec(actual)
    assert_equal MiniTest::Spec, actual
  end

end

class ActiveSupportCallbackTest < ActiveSupport::TestCase
 
  setup :foo
  setup :bar
 
  it 'works' do
    @foo.must_equal 'foo'
    @bar.must_equal 'bar'
  end
 
  private
 
  def foo ; @foo = 'foo' ; end
  def bar ; @bar = 'bar' ; end
 
end