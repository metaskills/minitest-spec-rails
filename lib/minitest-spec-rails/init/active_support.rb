module MiniTestSpecRails
  module Init
    module ActiveSupportBehavior

      extend ActiveSupport::Concern

      included do
        extend MiniTest::Spec::DSL
        include MiniTestSpecRails::DSL
        include ActiveSupport::Testing::ConstantLookup
        extend Descriptions
        register_spec_type(self) { |desc| Class === desc }
      end

      module Descriptions

        def described_class
          determine_constant_from_test_name(name) do |constant|
            Class === constant
          end
        end

      end

      def initialize(*args)
        Thread.current[:current_spec] = self
        super
      end if Minitest::VERSION < "5.3.3"

    end
  end
end

ActiveSupport::TestCase.send :include, MiniTestSpecRails::Init::ActiveSupportBehavior
