require "cloudfront-private/version"
require 'cloudfront-private/base'
require 'cloudfront-private/configuration'
require 'active_support/concern'

module Cloudfront
  module Private
		class << self
	    attr_accessor :root, :base_path
	
	    def configure(&block)
	      Cloudfront::Private::Base.configure(&block)
	    end
	    
	    def get_url(_resource,_request)
	    	Cloudfront::Private::Base.get_url(_resource,_request)
	    end
	  end
	  
	  autoload :Base, 'cloudfront-private/base'
	  autoload :Configuration, 'cloudfront-private/configuration'
	  
	  module Streaming
	  	autoload :Base, 'cloudfront-private/streaming/base'
	  end
  end
end
