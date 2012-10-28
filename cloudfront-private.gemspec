# -*- encoding: utf-8 -*-
require File.expand_path('../lib/cloudfront-private/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Krishna Srihari"]
  gem.email         = ["krishna.srihari@gmail.com"]
  gem.description   = %q{Cloudfront private streaming from Ruby on Rails }
  gem.summary       = %q{Cloudfront private streaming from Ruby on Rails}
  gem.homepage      = ""
	
	gem.add_development_dependency "rails", ">= 3.0.0"	
	gem.add_development_dependency "rspec", "~> 2.11"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "cloudfront-private"
  gem.require_paths = ["lib"]
  gem.version       = Cloudfront::Private::VERSION
end
