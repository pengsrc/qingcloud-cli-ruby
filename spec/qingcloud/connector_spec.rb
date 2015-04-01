require 'spec_helper'

module QingCloud
    module Cli

        RSpec.describe Utility do

            it 'can connect', focus: true do

                c = Connector.init_with_config_file
                puts c.launch('DescribeZones')

            end

        end

    end
end