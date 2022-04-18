module Freshdesk
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      def self.source_root
				@_freshdesk_source_root ||= File.expand_path("../templates", __FILE__)
      end

      def copy_initializer
				template "freshdesk.rb", "config/initializers/freshdesk.rb"
      end

      def copy_javascript_files
				directory "Freshdesk_Essentials", "app/javascript/Freshdesk_Essentials"
				copy_file "freshdesk.jsx", "app/javascript/packs/freshdesk.jsx"
				copy_file "babel.config.js", "babel.config.js", :force => true
				copy_file "webpacker.yml", "config/webpacker.yml", :force => true
				run "yarn add file:#{File.join(Gem.loaded_specs['freshdesk'].full_gem_path)}"
				run "yarn add --dev redux-devtools-extension"
      end

#      def modify_manifest
#				create_file 'app/assets/config/manifest.js' unless File.exists? 'app/assets/config/manifest.js'
#
#				append_to_file 'app/assets/config/manifest.js' do
#				  "\n"
#	  			"//= link freshdesk/manifest.js\n"
#					end
#      	end
    end
  end
end
