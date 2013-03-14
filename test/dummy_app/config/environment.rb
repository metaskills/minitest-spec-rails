require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.log_level = :debug
  config.cache_classes = false
  config.whiny_nils = true
  config.action_controller.session = {
    :key    => 'mtsr_session',
    :secret => 'ceae6058a816b1446e09ce90d8372511'
  }
end

