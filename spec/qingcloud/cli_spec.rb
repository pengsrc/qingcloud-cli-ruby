require 'spec_helper'

RSpec.describe QingCloud::Cli do

    it 'has a version number' do
        puts "Version: #{QingCloud::Cli::VERSION}"

        expect(QingCloud::Cli::VERSION).not_to be nil
    end

end
