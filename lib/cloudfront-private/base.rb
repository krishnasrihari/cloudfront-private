require 'cloudfront-private/streaming/base'

module Cloudfront
	module Private
		class Base
			include Cloudfront::Private::Streaming::Base
			include Cloudfront::Private::Configuration
		end
	end	
end