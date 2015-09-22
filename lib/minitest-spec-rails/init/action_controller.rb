module MiniTestSpecRails
  module Init
    module ActionControllerBehavior

      extend ActiveSupport::Concern

      included do
        register_spec_type(self) { |desc| Class === desc && desc < ActionController::Metal }
        register_spec_type(/Controller( ?Test)?\z/, self)
        register_spec_type(self) { |desc| Class === desc && desc < self }
        register_rails_test_case self
      end

      private

      def setup_controller_request_and_response
        if Util.rails30? || Util.rails31?
          self.class.tests described_class
        else
          describing_class.tests described_class
        end
        super
      end

    end
  end
end

ActionController::TestCase.send :include, MiniTestSpecRails::Init::ActionControllerBehavior
