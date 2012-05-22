if defined?(ActiveSupport::TestCase)
  class << ActiveSupport::TestCase
    remove_method :describe
  end

  MiniTest::Spec.register_spec_type ActiveSupport::TestCase do |desc|
    desc.respond_to?(:ancestors) && !(desc.ancestors.map(&:to_s) & ["ActiveRecord::Base", "Mongoid::Document", "MongoMapper::Document", "DataMapper::Resource"]).empty?
  end
end

if defined?(ActionController::TestCase)
  class ActionController::TestCase
    def self.determine_default_controller_class(name)
      if name.match(/.*(?:^|::)(\w+Controller)/)
        $1.safe_constantize
      else
        super(name)
      end
    end

    before { setup_controller_request_and_response }
  end

  MiniTest::Spec.register_spec_type /Controller/, ActionController::TestCase
end

if defined?(ActionDispatch::IntegrationTest)
  class ActionDispatch::IntegrationTest
    before { self.class.app = Rails.application }
  end

  MiniTest::Spec.register_spec_type /Integration Test$/, ActionDispatch::IntegrationTest
end