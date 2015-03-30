require 'spec_helper'

module QingCloud
    module Cli



        RSpec.describe Launch, focus: true do

            it 'connect' do

                launch = Launch.new ACCESS_KEY, SECRET_KEY
                launch.build('DescribeZones')

            end

        end

    end
end