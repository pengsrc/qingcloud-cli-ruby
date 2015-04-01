require 'spec_helper'

module QingCloud
    module Cli

        RSpec.describe Component::Zone do

            it 'can DescribeZones' do

                c = Connector.init_with_config_file
                z = Component::Zone.new c
                z.describe_zones [], status=['active']
                # puts z.response
                expect(z.response['action'] == 'DescribeZonesResponse').to be true
            end

        end

        RSpec.describe Component::Job do

            it 'can DescribeJobs' do

                c = Connector.init_with_config_file
                j = Component::Job.new c
                j.describe_jobs [], [], nil, nil, nil, nil, 'pek2'
                # puts j.response
                expect(j.response['action'] == 'DescribeJobsResponse').to be true
            end

        end

    end
end