require 'spec_helper'

module QingCloud
    module Cli

        RSpec.describe Component::Zone do

            it 'can DescribeZones', focus: true do

                c = Connector.init_with_config_file
                z = Component::Zone.new c
                puts z.describe_zones
            end

        end

    end
end