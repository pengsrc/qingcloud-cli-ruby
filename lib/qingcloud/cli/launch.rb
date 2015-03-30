module QingCloud
    module Cli

        class Launch

            API_URL = 'https://api.qingcloud.com/iaas/?'

            attr_accessor :access_key
            attr_accessor :secret_key

            def init(access_key, secret_key)
                self.access_key = access_key
                self.secret_key = secret_key
            end

            def set_zone

            end

        end

    end
end