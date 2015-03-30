require 'spec_helper'

module QingCloud
    module Cli

        RSpec.describe Launch, focus: true do

            it 'can connect' do

                launch = Launch.new
                launch.init ACCESS_KEY, SECRET_KEY
                puts launch.access_key
            end

        end

    end
end