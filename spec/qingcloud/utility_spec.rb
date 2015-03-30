require 'spec_helper'

module QingCloud
    module Cli

        RSpec.describe Utility do

            it 'has logger' do
                # Utility.logger.info 'Information'
                # Utility.logger.debug 'Debug'
                # Utility.logger.error 'Error'
                expect(Utility.logger).not_to be nil
                expect(Utility.logger.class).to eql Logger
            end

        end

    end
end