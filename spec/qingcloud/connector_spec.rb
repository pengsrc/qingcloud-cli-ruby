require 'spec_helper'

module QingCloud
    module Cli

        RSpec.describe Connector do

            it 'can connect' do

                c = Connector.init_with_config_file
            end

        end

    end
end