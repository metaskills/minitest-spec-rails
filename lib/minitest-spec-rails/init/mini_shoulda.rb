module MiniTestSpecRails
  module Init
    module MiniShouldaBehavior

      extend ActiveSupport::Concern

      included do
        class << self
          alias :should  :it
          alias :context :describe
        end
        extend ClassMethods
      end

      module ClassMethods

        def should_eventually(desc)
          it("should eventually #{desc}") { skip("Should eventually #{desc}") }
        end

      end

    end
  end
end

MiniTest::Spec.send :include, MiniTestSpecRails::Init::MiniShouldaBehavior
