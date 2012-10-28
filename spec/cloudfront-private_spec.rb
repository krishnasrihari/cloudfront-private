require 'cloudfront-private'

describe Cloudfront::Private do
	
	context "configuration" do
		before do
			Cloudfront::Private.configure do |config|
				config.key_pair_id = '867234983'
				config.pem_file	=	'xyz.pem'				
			end
		end
		
		it "key_pair_id" do
			Cloudfront::Private::Base.key_pair_id.should eq('867234983')			
		end
		
		it "pem file" do
			Cloudfront::Private::Base.pem_file.should eq('xyz.pem')
		end		
	end
	
end
