module MiniTestSpecRails
  class Railtie < ::Rails::Railtie
    
    config.minitest_spec_rails = ActiveSupport::OrderedOptions.new
    config.minitest_spec_rails.mini_shoulda = false

    if Rails.env.test?
      config.before_initialize do |app|
        return unless Rails.env.test?
        require 'active_support'
        require 'minitest-spec-rails/init/active_support'
        ActiveSupport.on_load(:action_view) do
          require 'minitest-spec-rails/init/action_view'
        end
        ActiveSupport.on_load(:action_controller) do
          require 'minitest-spec-rails/init/action_controller'
          require 'minitest-spec-rails/init/action_dispatch'
        end
        ActiveSupport.on_load(:action_mailer) do
          require 'minitest-spec-rails/init/action_mailer'
        end
      end

      initializer 'minitest-spec-rails.mini_shoulda', :group => :all do |app|
        require 'minitest-spec-rails/init/mini_shoulda' if app.config.minitest_spec_rails.mini_shoulda
      end
    end
    
  end
end
