module QingCloud
    module Cli
        module Component

            class Zone < Base

                def describe_zones(
                    zones=[],
                    status=[]) eval(build_fetch_match)
                end

            end

        end
    end
end