require 'json'

module QingCloud
    module Cli
        module Utility

            def self.json_parser
                unless self.class_variable_defined? '@@json_parser'
                    @@json_parser = JsonParser.new
                end
                @@json_parser
            end

            class JsonParser

                def encode(object)
                    JSON.generate object
                end

                def encode_prettily(object)
                    JSON.pretty_generate object
                end

                def decode(string)
                    JSON.parse string
                end

            end
        end
    end
end