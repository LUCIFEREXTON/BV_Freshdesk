# frozen_string_literal: true

require_relative "freshdesk/version"
require 'BlogVault/error.rb'
require 'base64'
module Freshdesk
	class Engine < ::Rails::Engine
		config.autoload_paths << "#{Gem.loaded_specs['freshdesk'].full_gem_path}/lib"
	end
  
	class Error < StandardError
	end

  class << self
  	attr_accessor :api_key, :base_url	
		def config(api, url)
			self.api_key = "Basic #{Base64.strict_encode64(api)}"
			self.base_url = "#{url}/api/v2"
		end
  end
end
