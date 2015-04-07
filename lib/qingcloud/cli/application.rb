module QingCloud
    module Cli

        class Application

            attr_accessor :sub_command
            attr_accessor :options

            def initialize(arguments)

                Control.prepare_config_file

                command = arguments.shift

                Control.check_command(command)
                Control.perform_service(command, Control.parse_options(command, arguments))
            end

        end

    end
end