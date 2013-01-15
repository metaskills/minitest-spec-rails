ActionMailer::TestCase.instance_eval do

  register_spec_type(self) do |desc|
    Class === desc && desc < ActionMailer::Base
  end

  register_spec_type(/Mailer( ?Test)?\z/i, self)

end
