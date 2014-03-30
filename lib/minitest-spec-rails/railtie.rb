module MiniTestSpecRails
  class Railtie < ::Rails::Railtie

    config.minitest_spec_rails = ActiveSupport::OrderedOptions.new
    config.minitest_spec_rails.mini_shoulda = false

    config.before_initialize do |app|
      require 'active_support'
      require 'minitest-spec-rails/init/active_support'
      ActiveSupport.on_load(:action_controller) do
        require 'minitest-spec-rails/init/action_controller'
        require 'minitest-spec-rails/init/action_dispatch'
      end
      ActiveSupport.on_load(:action_mailer) do
        require 'minitest-spec-rails/init/action_mailer'
      end
    end if Rails.env.test?

    initializer 'minitest-spec-rails.action_view', :after => 'action_view.setup_action_pack', :group => :all do |app|
      require 'minitest-spec-rails/init/action_view'
    end if Rails.env.test?

    initializer 'minitest-spec-rails.mini_shoulda', :group => :all do |app|
      require 'minitest-spec-rails/init/mini_shoulda' if app.config.minitest_spec_rails.mini_shoulda
    end if Rails.env.test?

  end
end
