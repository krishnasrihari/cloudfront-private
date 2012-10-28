# -*- encoding: utf-8 -*-
require File.expand_path('../lib/cloudfront-private/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Krishna Srihari"]
  gem.description   = %q{Cloudfront private streaming from Ruby on Rails }
  gem.summary       = %q{Cloudfront private streaming for mp3, mp4 and flv}  
	
	gem.add_development_dependency "rails", ">= 3.0.0"	
	gem.add_development_dependency "rspec"
	gem.add_development_dependency "cucumber"
	gem.add_development_dependency "aruba"
	gem.add_development_dependency "thor"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "cloudfront-private"
  gem.require_paths = ["lib"]
  gem.version       = Cloudfront::Private::VERSION
end
