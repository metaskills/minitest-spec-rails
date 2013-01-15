require 'minitest-spec-rails'
require 'minitest/autorun'
require 'pp'

module Test
  module Unit

    remove_const(:TestCase) if defined?(self::TestCase)
    class TestCase < ::MiniTest::Spec
      
      MINITEST_SPEC_RAILS = true

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
      
    end
    
  end
end
