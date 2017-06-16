module MiniTestSpecRails
  class Railtie < ::Rails::Railtie

    config.minitest_spec_rails = ActiveSupport::OrderedOptions.new
    config.minitest_spec_rails.mini_shoulda = false

    config.before_initialize do |app|
      if Rails.env.test?
        ActiveSupport.on_load(:action_controller) do
          require 'minitest-spec-rails/init/action_controller'
          require 'action_dispatch/testing/integration' # For Rails 3.0 loading.
          require 'minitest-spec-rails/init/action_dispatch'
        end
        ActiveSupport.on_load(:action_mailer) do
          require 'minitest-spec-rails/init/action_mailer'
        end
      end
    end

    initializer 'minitest-spec-rails.action_view', :after => 'action_view.setup_action_pack', :group => :all do |app|
      require 'minitest-spec-rails/init/action_view'
    end if Rails.env.test?

    initializer 'minitest-spec-rails.after.load_active_support', :after => :load_active_support, :group => :all do |app|
      if Rails.env.test?
        require 'minitest-spec-rails/init/mini_shoulda' if app.config.minitest_spec_rails.mini_shoulda
      end
    end

  end
end
