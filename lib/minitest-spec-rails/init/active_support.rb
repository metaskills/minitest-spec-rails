ActiveSupport::TestCase.instance_eval do

  class << self
    remove_method :describe
  end

  register_spec_type(self) do |desc|
    Class === desc && desc < ActiveRecord::Base      
  end

end
