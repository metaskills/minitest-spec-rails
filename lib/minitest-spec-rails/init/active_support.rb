module MiniTestSpecRails
  module Init
    module ActiveSupportBehavior

      extend ActiveSupport::Concern

      included do
        singleton_class.class_eval { remove_method :describe }
        extend MiniTest::Spec::DSL
        include MiniTestSpecRails::DSL
        register_spec_type(self) { |desc| Class === desc }
        register_rails_test_case self
      end

      def initialize(*args)
        Thread.current[:current_spec] = self
        super
      end

    end
  end
end

ActiveSupport::TestCase.send :include, MiniTestSpecRails::Init::ActiveSupportBehavior
