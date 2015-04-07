module QingCloud
    module Cli

        class Control

            def self.prepare_config_file
                unless File.exist? SDK::Contract::CONFIG_FILE_PATH
                    SDK::Utility.file_manager.create_new_config_file
                end
            end

            def self.check_command(command)
                unless Service::SERVICE_MAP[command]
                    puts 'Usage: qingcloud <action> [options]'
                    puts ''
                    puts 'Available actions:'
                    puts ''
                    Service::SERVICE_MAP.each { |key, _|
                        puts key
                    }

                    exit
                end
            end

            def self.parse_options(command, arguments)

                options = {}

                opt_parser = OptionParser.new do |opts|
                    opts.banner = Service::SERVICE_MAP[command][:description]
                    opts.separator ''
                    opts.separator 'Specific options:'

                    opts.on_tail('-h', '--help', 'show help message') do
                        puts opts
                        exit
                    end

                    opts.on_tail('-I', '--interactive', 'use command line tool interactively') do
                        puts 'interactively'
                        exit
                    end

                    Service::SERVICE_MAP[command][:options].each { |option|

                        opts.on(
                            "-#{option[:short]}",
                            "--#{option[:full]} #{option[:full].upcase}",
                            option[:is_array]? Array : option[:type] ,
                            option[:description]
                        ) do |value|

                            if option[:is_array] && option[:type] == Numeric
                                options[option[:full]] = value.map { |x|
                                    x.to_i
                                }
                            else
                                options[option[:full]] = value
                            end
                        end
                    }

                end


                begin
                    opt_parser.parse! arguments

                rescue OptionParser::AmbiguousArgument => e
                    retry
                rescue OptionParser::AmbiguousOption => e
                    retry
                rescue OptionParser::InvalidArgument => e
                    retry
                rescue OptionParser::InvalidOption => e
                    retry
                end

                Service::SERVICE_MAP[command][:options].each { |option|

                    if option[:required] && !options[option[:full]]

                        puts "Argument Missing: Please use \"-#{option[:short]}\" / \"--#{option[:full]}\" to provide #{option[:description]}"
                        puts ''
                        puts opt_parser

                        exit
                    end
                }

                options
            end

            def self.perform_service(command, options)

                options_code = options.map { |key, value|
                    if value.is_a? Array
                        "#{key}_N: [#{
                            value.map { |x|
                                if x.is_a? Numeric
                                    "#{x}"
                                else
                                    "\"#{x}\""
                                end
                            }.join(',')}
                        ]"
                    else
                        if value.is_a? Numeric
                            "#{key}: #{value}"
                        else
                            "#{key}: \"#{value}\""
                        end
                    end
                }.join(',')

                begin

                    response = eval("
                                        connector = SDK::Client::Connector.init_with_config_file
                                        service = SDK::Client::Service.new connector

                                        service.#{command.gsub('-', '_')}(#{options_code})
                                        service.response
                                    ")

                    puts SDK::Utility.json_parser.encode_prettily response

                rescue SDK::Error::SDKError => e
                    puts e.message
                end

            end
        end

    end
end