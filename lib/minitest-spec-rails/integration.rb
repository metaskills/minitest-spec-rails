module MiniTestSpecRails
  class Integration < Spec
    include ActionController::Integration::Runner
    include ActionController::TemplateAssertions
    include ActionDispatch::Routing::UrlFor

    def app
      Rails.application
    end
  end
end

MiniTest::Spec.register_spec_type(/Integration Test$/, MiniTestSpecRails::Integration)
