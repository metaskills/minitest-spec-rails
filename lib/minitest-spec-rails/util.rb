module MiniTestSpecRails
  module Util
    
    def self.rails3?  ; rails30? || rails31? || rails32? ; end
    def self.rails30? ; rails_version == '3.0' ; end
    def self.rails31? ; rails_version == '3.1' ; end
    def self.rails32? ; rails_version == '3.2' ; end
    def self.rails40? ; rails_version == '4.0' ; end

    def self.rails_version ; ::Rails.version.split('.')[0,2].join('.') ; end

  end
end
