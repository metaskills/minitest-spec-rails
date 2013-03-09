module MiniTestSpecRails
  module Init
    module MiniShouldaBehavior

      def self.included(klass)
        klass.class_eval do
          class << self
            alias :context  :describe
            alias :should   :it
          end
          extend ClassMethods
        end
      end

      module ClassMethods

        def should_eventually(desc)
          it("should eventually #{desc}") { skip("Should eventually #{desc}") }
        end

      end

    end
  end
end

ActiveSupport::TestCase.send :include, MiniTestSpecRails::Init::MiniShouldaBehavior
