module Freshdesk
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      def self.source_root
	@_freshdesk_source_root ||= File.expand_path("../templates", __FILE__)
      end

      def copy_initializer
	template "freshdesk.rb", "config/initializers/freshdesk.rb"
      end

      def modify_manifest
	create_file 'app/assets/config/manifest.js' unless File.exists? 'app/assets/config/manifest.js'

	append_to_file 'app/assets/config/manifest.js' do
	  "\n"
	  "//= link freshdesk/manifest.js\n"
	end
      end
    end
  end
end
