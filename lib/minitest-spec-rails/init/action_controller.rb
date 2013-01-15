ActionController::TestCase.instance_eval do

  register_spec_type(self) do |desc|
    Class === desc && desc < ActionController::Metal
  end

  register_spec_type(/Controller( ?Test)?\z/i, self)

end

ActionDispatch::IntegrationTest.instance_eval do

  register_spec_type(/(Acceptance|Integration) ?Test\z/i, self)

end
