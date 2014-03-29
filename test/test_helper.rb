require 'dummy_app/init'
require 'support/shared_test_case_behavior'

module MiniTestSpecRails
  class TestCase < MiniTest::Spec

    include MiniTestSpecRails::SharedTestCaseBehavior


  end
end
