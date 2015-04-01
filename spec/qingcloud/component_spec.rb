require 'spec_helper'

module QingCloud
    module Cli

        RSpec.describe Component::Zone do

            it 'can DescribeZones' do

                c = Connector.init_with_config_file
                z = Component::Zone.new c
                z.describe_zones [], status=['active']
                puts z.zone_set
            end

        end

        RSpec.describe Component::Job do

            it 'can DescribeZones', focus: true do

                c = Connector.init_with_config_file
                j = Component::Job.new c
                j.describe_jobs [], [], nil, nil, nil, nil, 'pek2'
                puts j.job_set
            end

        end

    end
end