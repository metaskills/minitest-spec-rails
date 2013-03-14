module MiniTestSpecRails
  module Init
    module MiniShouldaBehavior

      def self.included(klass)
        klass.class_eval do
          class << self
            
            alias :context  :describe
            alias :should   :it

            def setup_with_minitest(*args, &block)
              if args.first.is_a?(Symbol) && !block_given?
                setup_without_minitest(args.first)
              else
                setup_without_minitest { |o| o.instance_eval(&block) }
              end
            end
            alias_method_chain :setup, :minitest

            def teardown_with_minitest(*args, &block)
              if args.first.is_a?(Symbol) && !block_given?
                teardown_without_minitest(args.first)
              else
                teardown_without_minitest { |o| o.instance_eval(&block) }
              end
            end
            alias_method_chain :teardown, :minitest

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
