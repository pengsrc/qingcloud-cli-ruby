module QingCloud
    module Cli

        class Application

            attr_accessor :sub_command
            attr_accessor :options

            def initialize(arguments)
                @arguments = arguments

                parse_sub_command
                parse_options
            end

            private

            def parse_sub_command
                puts @arguments.shift
            end

            def parse_options

            end

        end

    end
end