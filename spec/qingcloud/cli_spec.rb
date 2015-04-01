require 'spec_helper'

module QingCloud
    module Cli

        RSpec.describe QingCloud::Cli do

            it 'has a version number' do
                puts "Version: #{VERSION}"

                expect(VERSION).not_to be nil
            end

        end

    end
end


