require 'test_helper'

class SomeRandomModel < ActiveRecord::Base; end

class ActiveSupportTest < MiniTestSpecRails::TestCase

  it 'removes ActiveSupport describe method' do
    ActiveSupport::TestCase.singleton_methods(false).map(&:to_sym).wont_include :describe
  end

  it 'resolves spect type for active record constants' do
    assert_support MiniTest::Spec.spec_type(SomeRandomModel)
    assert_support MiniTest::Spec.spec_type(Dummy::User)
  end

  it 'wont resolve spect type for random strings' do
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
