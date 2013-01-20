module MiniTestSpecRails
  module Init
    module ActionDispatchBehavior

      extend ActiveSupport::Concern

      included do
        register_spec_type(/(Acceptance|Integration) ?Test\z/i, self)
        register_spec_type(self) { |desc| Class === desc && desc < self }
        register_rails_test_case self
      end

    end
  end
end

ActionDispatch::IntegrationTest.send :include, MiniTestSpecRails::Init::ActionDispatchBehavior
