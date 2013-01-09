module MiniTestSpecRails
  class Spec < MiniTest::Spec
    class << self
      def setup(*args)
      end

      def teardown(*args)
      end
    end

    include ActionController::TestCase::Behavior
  end
end
