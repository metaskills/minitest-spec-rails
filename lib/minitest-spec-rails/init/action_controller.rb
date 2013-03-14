module MiniTestSpecRails
  module Init
    module ActionControllerBehavior

      def self.included(klass)
        klass.class_eval do
          register_spec_type(/Controller( ?Test)?\z/i, self)
          register_spec_type(self) { |desc| Class === desc && desc < self }
          register_rails_test_case self
        end
      end

      private

      def setup_controller_request_and_response
        describing_class.tests described_class
        super
      end

    end
  end
end

ActionController::TestCase.send :include, MiniTestSpecRails::Init::ActionControllerBehavior
