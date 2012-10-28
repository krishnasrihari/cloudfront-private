require 'openssl'
require 'digest/sha2'
require 'base64'
require "cloudfront-private/version"
require 'cloudfront-private/configuration'

require 'rails'


module Cloudfront
	module Private
		module Streaming
			module Base
				extend ActiveSupport::Concern
				include Cloudfront::Private::Configuration
				
				KEY_PAIR_ID = @key_pair_id
			
			  def self.get_url(_request, _resource)
			    url = get_signed_url(_resource, _request)
			    # Escape characters for proper embedding in Flash parameters
			    return url.gsub("?","%3F").gsub("=","%3D").gsub("&","%26")
			  end
			
			  protected
			
			    def self.get_signed_url(_resource, _request)
			      pk_file        = Rails.root.join('certs',@pem_file)
			      key            = OpenSSL::PKey::RSA.new(File.readlines(pk_file).join(""))
			      policy         = create_policy(_resource, _request)
			      sigcrypt       = key.sign(OpenSSL::Digest::SHA1.new, policy)
			      urlsig         = escape_string(Base64.encode64(sigcrypt))
			      encoded_policy = escape_string(Base64.encode64(policy))
			      return "#{_resource}?Policy=#{encoded_policy}&Signature=#{urlsig}&Key-Pair-Id=#{KEY_PAIR_ID}"
			    end
			
			    def self.create_policy(_resource, _request)
			      expires = 1.hour.from_now.to_i
			      # Skip IP check for localhost (AWS:SourceIp does not work with localhost)
			      if Rails.env.development?
			        policy = %{ {"Statement":
			          [{ 
			            "Resource": "#{_resource}",
			            "Condition": { 
			              "DateLessThan": { "AWS:EpochTime": #{expires} }
			            }
			          }]}
			        }
			      else
			        ip = "#{_request.remote_ip}/24"
			        policy = %{ {"Statement":
			          [{ 
			            "Resource": "#{_resource}",
			            "Condition": { 
			              "DateLessThan": { "AWS:EpochTime": #{expires} },
			              "IpAddress": { "AWS:SourceIp": "#{ip}" }
			            }
			          }]}
			        }
			      end
			      return policy
			    end
			
			    def self.escape_string(_str)
			      _str.gsub('+','-').gsub('=','_').gsub('/','~').gsub(/\n/,'')
			    end
	
				
			end
		end
	end
end
