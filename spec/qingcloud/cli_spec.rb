require 'spec_helper'

RSpec.describe QingCloud::Cli do |cli|

    it 'has a version number' do
        puts cli::VERSION
        expect(cli::VERSION).not_to be nil
    end

end
