require "cloudfront-private/version"

module Cloudfront
  module Private
		class << self
	    attr_accessor :root, :base_path
	
	    def configure(&block)
	      Cloudfront::Private::Base.configure(&block)
	    end	
	  end
	  
	  autoload :base, Cloudfront::Private::Base
  end
end
