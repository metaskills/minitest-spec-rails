module MiniTestSpecRails
  module DSL

    RAILS_TEST_CASES = []

    def self.included(klass)
      klass.extend ClassMethods
      remove_method :test if method_defined?(:test)
    end

    module ClassMethods

      def before(type = nil, &block)
        setup { self.instance_eval(&block) }
      end

      def after(type = nil, &block)
        teardown { self.instance_eval(&block) }
      end

      def test(name, &block)
        it { self.instance_eval(&block) }
      end

      def rails_test_cases
        RAILS_TEST_CASES
      end

      def register_rails_test_case(test_case)
        return if RAILS_TEST_CASES.include?(test_case)
        RAILS_TEST_CASES.unshift(test_case)
      end

      def describing_class
        ancestors.detect { |a| Class === a && rails_test_cases.include?(a.superclass) }
      end

      def described_class
        begin
          describing_class.name.gsub(/Test$/, '').constantize
        rescue NameError
          nil
        end
      end
      
    end

    def describing_class
      self.class.describing_class
    end

    def described_class
      self.class.described_class
    end
    
  end
end