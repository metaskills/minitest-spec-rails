module MiniTestSpecRails
  class Railtie < ::Rails::Railtie
    
    config.minitest_spec_rails = ActiveSupport::OrderedOptions.new
    
    config.before_initialize do |app|
      ActiveSupport.on_load(:action_view)       { require 'minitest-spec-rails/init/action_view' }
      ActiveSupport.on_load(:action_controller) { require 'minitest-spec-rails/init/action_controller' }
      ActiveSupport.on_load(:action_mailer)     { require 'minitest-spec-rails/init/action_mailer' }
    end

    initializer 'minitest-spec-rails.after.load_active_support', :after => :load_active_support, :group => :all do |app|
      require 'minitest-spec-rails/init/active_support'
    end
    
  end
end
