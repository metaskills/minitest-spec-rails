module MiniTestSpecRails
  module DSL

    def self.included(klass)
      klass.extend ClassMethods
      remove_method :test if method_defined?(:test)
    end

    module ClassMethods

      def describe(*args, &block)
        stack = Minitest::Spec.describe_stack
        stack.push self if stack.empty?
        super(*args) { class_eval(&block) }
        stack.pop if stack.length == 1
      end

      def before(type = nil, &block)
        setup { self.instance_eval(&block) }
      end

      def after(type = nil, &block)
        teardown { self.instance_eval(&block) }
      end

      def test(name, &block)
        it(name) { self.instance_eval(&block) }
      end

      def described_class
        nil
      end
      
    end

    def described_class
      self.class.described_class
    end
    
  end
end
