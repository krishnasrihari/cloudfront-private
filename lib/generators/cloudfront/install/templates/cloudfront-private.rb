Cloudfront::Private.configure do |config|
	config.key_pair_id = 'your-key-pair-id'
	config.pem_file = 'your-private.pem'
end
