module MiniTestSpecRails
  class Mailer < Spec
    include ActionMailer::TestCase::Behavior
  end
end

MiniTest::Spec.register_spec_type(/Mailer$/, MiniTestSpecRails::Mailer)
