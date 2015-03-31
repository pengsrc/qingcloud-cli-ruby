require 'logger'

module QingCloud
    module Cli
        module Utility

            def self.logger
                unless self.class_variable_defined? '@@logger'
                    @@logger = Logger.new(STDOUT)
                end
                @@logger
            end

        end
    end
end