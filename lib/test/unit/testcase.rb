require 'minitest-spec-rails'
require 'pp'

module Test
  module Unit

    remove_const(:TestCase) if defined?(self::TestCase)
    class TestCase < ::MiniTest::Spec
      
      # Let Others Know

      MINITEST_SPEC_RAILS = true

      # Test::Unit Compatability 

      def mu_pp(obj)
        obj.pretty_inspect.chomp
      end

      def assert_block(*msgs)
        assert yield, *msgs
      end

      def build_message(head, template=nil, *arguments)
        template &&= template.chomp
        template.gsub(/\G((?:[^\\]|\\.)*?)(\\)?\?/) { $1 + ($2 ? "?" : mu_pp(arguments.shift)) }
      end

      # MiniTestSpecRails Additions

      RAILS_TEST_CASES = []

      def self.rails_test_cases
        RAILS_TEST_CASES
      end

      def self.register_rails_test_case(test_case)
        return if RAILS_TEST_CASES.include?(test_case)
        RAILS_TEST_CASES.unshift(test_case)
      end

      def self.describing_class
        ancestors.detect { |a| Class === a && rails_test_cases.include?(a.superclass) }
      end

      def describing_class
        self.class.describing_class
      end

      def self.described_class
        begin
          describing_class.name.gsub(/Test$/, '').constantize
        rescue NameError
          nil
        end
      end

      def described_class
        self.class.described_class
      end
      
    end
    
  end
end

silence_warnings { MiniTest::Unit::TestCase = Test::Unit::TestCase } unless MiniTestSpecRails::Util.rails3?
