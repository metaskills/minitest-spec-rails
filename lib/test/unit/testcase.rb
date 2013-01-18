require 'minitest-spec-rails'
require 'minitest/autorun'
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

      def self.describing_class
        ancestors.detect { |a| Class === a && a.superclass == spec_type(self) }
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
