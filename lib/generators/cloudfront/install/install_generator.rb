require 'rails'
require 'rails/generators'

module Cloudfront
	class InstallGenerator < Rails::Generators::Base
		source_root File.expand_path("../templates", __FILE__)
		
		desc "This generator creates an initializer file at config/initializers"
		def add_initializer
			template "cloudfront-private.rb", "config/initializers/cloudfront-private.rb"
		end
	end
end
	
