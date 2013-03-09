module MiniTestSpecRails
  module Init
    module ActionMailerBehavior

      def self.included(klass)
        klass.class_eval do
          register_spec_type(self) { |desc| Class === desc && desc < ActionMailer::Base }
          register_spec_type(/Mailer( ?Test)?\z/i, self)
          register_spec_type(self) { |desc| Class === desc && desc < self }
          register_rails_test_case self
          before { setup_minitest_spec_rails_mailer_class }
        end
      end

      private

      def setup_minitest_spec_rails_mailer_class
        describing_class.tests described_class
      end

    end
  end
end

ActionMailer::TestCase.send :include, MiniTestSpecRails::Init::ActionMailerBehavior

