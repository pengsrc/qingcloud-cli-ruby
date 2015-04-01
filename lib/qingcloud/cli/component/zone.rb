module QingCloud
    module Cli
        module Component

            class Zone < Base

                def describe_zones

                    send_request 'DescribeZones',
                                      {

                                      }
                end

            end

        end
    end
end