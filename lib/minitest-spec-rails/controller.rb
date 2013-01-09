module MiniTestSpecRails
  class Controller < Spec
    def self.determine_default_controller_class(name)
      if name =~ /Controller/
        name.gsub(/::\w+$/, '').safe_constantize
      else
        super
      end
    end

    before do
      setup_controller_request_and_response

      @routes = Rails.application.routes
    end
  end
end

MiniTest::Spec.register_spec_type(/Controller$/, MiniTestSpecRails::Controller)
