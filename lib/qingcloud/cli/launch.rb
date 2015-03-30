require 'cgi'
require 'openssl'
require 'base64'
require 'net/http'

module QingCloud
    module Cli

        class Launch

            API_URL = 'https://api.qingcloud.com/iaas/?'

            attr_accessor :access_key
            attr_accessor :secret_key

            def initialize(access_key, secret_key)
                unless access_key && access_key.length > 0; return nil; end
                unless secret_key && secret_key.length > 0; return nil; end

                self.access_key = access_key
                self.secret_key = secret_key

                @ready = false
            end

            def ready?; @ready; end

            def build(action, params={})
                unless action && action.length > 0; return false; end

                params.update(
                    action: action,
                    time_stamp: Time.now.utc.strftime('%Y-%m-%dT%H:%M:%SZ'),
                    access_key_id: access_key,
                    version: 1,
                    signature_method: 'HmacSHA256',
                    signature_version: 1
                )

                request_body = params.sort.map { |key, value|
                    "#{CGI.escape key.to_s}=#{CGI.escape value.to_s}"
                }.join '&'

                signature = CGI.escape(
                    Base64.encode64(
                        OpenSSL::HMAC.digest(
                            OpenSSL::Digest.new('sha256'),
                            self.secret_key,
                            "GET\n/iaas/\n#{request_body}"
                        ).strip
                    ).strip.gsub(' ', '+')
                )

                request_url = "#{API_URL}#{request_body}&signature=#{signature}"

                puts Net::HTTP.get URI(request_url)

                @ready = true
            end

            def dispatch(action, params={})

            end

        end

    end
end