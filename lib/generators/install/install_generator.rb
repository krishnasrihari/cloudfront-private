module Cloudfront
	module Private
		class InstallGenerator < Rails::Generators::Base
			source_root File.expand_path("../templates", __FILE__)
			
			def add_initializer
				template "cloudfront-private.rb", "config/initializers/cloudfront-private.rb"
			end
		end
	end
end