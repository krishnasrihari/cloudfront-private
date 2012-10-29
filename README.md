# Cloudfront-Private

Streaming all media private contents from amazon cloudfront  

## Installation

Add this line to your application's Gemfile:

    gem 'cloudfront-private'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cloudfront-private
    
## Getting started

Generate initializer cloudfront-private
 
     $ rails generate cloudfront:install
     
this should generated a file called cloudfront-private.rb in config/initializers

checkout this file to add amazon cloudfront credentials

		Cloudfront::Private.configure do |config|
			config.key_pair_id = 'your-key-pair-id'
			config.pem_file = 'your-private.pem'
		end
		
Edit above file with your amazon cloudfront private key pair id and pem file name

The private pem file should placed in 'certs' directory under Rails root
   
Access private content in your view

		<% filename = "bucket-name/filename.mp4/flv %> 
		<% file = Cloudfront::Private::Streaming::Base.get_url(request,filename) %>
		<div id='media-file'></div>

Write javascript file to stream your private in jwplayer with jquery

		function private_streaming(){
			var flashvars = {
		    file: media,
		    provider:'rtmp',
		    streamer: 'rtmp://xxxxx.cloudfront.net/cfx/st'    
		  };
		  var params = {
		  	allowfullscreen: 'false', 
		  	allowscriptaccess:'always'
		  };
		  var attributes ={
		  	id: 'jwplayer',
		  	name: 'jwplayer'
		  }
		  swfobject.embedSWF('/jwplayer/player.swf','media_player','300','24','9.0.115','false', 
		  	flashvars, params, attributes,flashLoaded);  	
		}
		
		$(document).ready(private_streaming);

Restart your server to get cloudfront configuration		
		              
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
