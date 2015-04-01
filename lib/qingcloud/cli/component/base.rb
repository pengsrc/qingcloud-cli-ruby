module QingCloud
    module Cli
        module Component

            class Base

                ERROR_CODE_MAP = {
                    1100 => 'Request Format Invalid',
                    1200 => 'Authentication Failed',
                    1300 => 'Request Expired',
                    1400 => 'Request Denied',
                    2100 => 'Resource Not Found',
                    2400 => 'Balance Insufficient',
                    2500 => 'Over Quota',
                    5000 => 'Internal Error',
                    5100 => 'Server Busy',
                    5200 => 'Resources Inadequate',
                    5300 => 'Server Updating',
                }


                def initialize(connector)
                    @connector = connector
                end

                private

                def fetch_response(action, params={})

                    response_body = @connector.fetch action, params

                    raise Error::APIError, 'No Response Data Received' unless response_body['ret_code']

                    if response_body['ret_code'] != 0
                        raise Error::APIError, response_body['message'] || ERROR_CODE_MAP[response_body['ret_code']]
                    end

                    response_body
                end

            end

        end
    end
end