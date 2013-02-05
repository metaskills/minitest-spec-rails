module MiniTestSpecRails
  module Init
    module ActionViewBehavior

      extend ActiveSupport::Concern

      included do
        class_attribute :_helper_class
        register_spec_type(/(Helper|View)( ?Test)?\z/i, self)
        register_spec_type(self) { |desc| Class === desc && desc < self }
        register_rails_test_case self
        before { setup_minitest_spec_rails_helper_class }
      end

      private

      def helper_class=(new_class)
        self._helper_class = new_class
      end
      
      def helper_class
        if current_helper_class = self._helper_class
          current_helper_class
        else
          self.helper_class = determine_default_helper_class(name)
        end
      end

      def setup_minitest_spec_rails_helper_class
        self.class.helper_class = described_class
        self.class.send :include_helper_modules!
      end

    end
  end
end

ActionView::TestCase.send :include, MiniTestSpecRails::Init::ActionViewBehavior
