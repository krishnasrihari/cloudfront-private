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
	
	context "get_url" do
		let(:resource) { 'streaming/private-media/12.mp4' }
		let(:request) { 'request' }

		before do
			Rails.stub(:root).and_return(['/rails'])
			
			Cloudfront::Private.configure do |config|
				config.key_pair_id = '867234983'
				config.pem_file	=	'xyz.pem'				
			end
		end

		it "should be accessible" do
			Cloudfront::Private.get_url(resource,request).should_not be_nil
		end
	end
	
end
