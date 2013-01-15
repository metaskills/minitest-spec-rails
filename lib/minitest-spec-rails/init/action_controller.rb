ActionController::TestCase.instance_eval do

  register_spec_type(self) do |desc|
    Class === desc && desc < ActionController::Metal
  end

  register_spec_type(/Controller( ?Test)?\z/i, self)

end

ActionDispatch::IntegrationTest.instance_eval do

  register_spec_type(/(Acceptance|Integration) ?Test\z/i, self)

end

# class ActionController::TestCase
#   def self.determine_default_controller_class(name)
#     if name.match(/.*(?:^|::)(\w+Controller)/)
#       $1.constantize rescue nil
#     else
#       super(name)
#     end
#   end
#   before { setup_controller_request_and_response }
# end

# class ActionController::IntegrationTest
#   before { self.class.app = Rails.application }
# end
