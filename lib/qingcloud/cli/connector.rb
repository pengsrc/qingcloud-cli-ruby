require 'cgi'
require 'openssl'
require 'base64'
require 'net/http'

module QingCloud
    module Cli

        class Connector

            API_URL = 'https://api.qingcloud.com/iaas/?'

            attr_accessor :access_key
            attr_accessor :secret_key

            def initialize(access_key, secret_key)
                raise Error::ParameterError, 'Load API Key' unless access_key && access_key.length > 0
                raise Error::ParameterError, 'Load API Key' unless secret_key && secret_key.length > 0

                self.access_key = access_key
                self.secret_key = secret_key
            end

            def self.init(access_key, secret_key)
                Connector.new access_key, secret_key
            end

            def self.init_with_config_file
                config_map = {}
                content = Utility.file_manager.read_config_file
                config_map = Utility.json_parser.decode content if content
                Connector.new config_map['qy_access_key_id'], config_map['qy_secret_access_key']
            end

            def launch(action, params={})
                raise Error::ParameterError, 'Check API Request' unless action && action.length > 0

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

                response = Net::HTTPResponse.new 1.1, 500, 'Error'

                begin
                    response = Net::HTTP.get_response URI(request_url)
                rescue
                    raise Error::NetworkError
                end

                raise Error::ServerError, response.code unless response.code == '200'

                Utility.json_parser.decode response.body
            end

        end

    end
end