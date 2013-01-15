require 'minitest-spec-rails'
require 'minitest/autorun'

module Test
  module Unit

    remove_const(:TestCase) if defined?(self::TestCase)
    class TestCase < ::MiniTest::Spec
      
      MINITEST_SPEC_RAILS = true
      
    end
    
  end
end
