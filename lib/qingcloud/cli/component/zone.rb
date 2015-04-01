module QingCloud
    module Cli
        module Component

            class Zone < Base

                attr_accessor :action
                attr_accessor :zone_set
                attr_accessor :total_count

                def describe_zones(zones=[], status=[])

                    params = {}
                    params.update(zones: zones) if zones.length > 0
                    params.update(status: status) if status.length > 0

                    response_body = fetch_response 'DescribeZones', params

                    self.action = response_body['action']
                    self.zone_set = response_body['zone_set']
                    self.total_count = response_body['total_count']
                end

            end

        end
    end
end