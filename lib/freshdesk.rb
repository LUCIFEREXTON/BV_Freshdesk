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
    attr_accessor :app, :api_key, :base_url, :routes	
    def config(app_name, api, url, routes)
      self.app = app_name
      self.api_key = "Basic #{Base64.strict_encode64(api)}"
      self.base_url = "#{url}/api/v2"
      self.routes = routes
    end
  end
end
