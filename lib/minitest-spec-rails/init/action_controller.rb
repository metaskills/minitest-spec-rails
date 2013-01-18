ActionController::TestCase.instance_eval do

  register_spec_type(self) do |desc|
    Class === desc && desc < ActionController::Metal
  end

  register_spec_type(/Controller( ?Test)?\z/i, self)

  before { self.class.controller_class }

end

require 'action_dispatch/testing/integration' # For Rails 3.0 loading.
ActionDispatch::IntegrationTest.instance_eval do

  register_spec_type(/(Acceptance|Integration) ?Test\z/i, self)

end
