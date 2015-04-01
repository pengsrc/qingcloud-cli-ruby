module QingCloud
    module Cli
        module Error

            class CommonError < StandardError
            end

            class UnknownError < StandardError
                def message
                    'Encounter Unknown Error'
                end
            end

            class NetworkError < StandardError
                def message
                    'Encounter Network Error'
                end
            end

            class ServerError < StandardError
                def initialize(code)
                    super "Server Response with \"#{code}\""
                end
            end

            class AnalyseError < StandardError
                def initialize(something)
                    super "Analyse Error when \"#{something}\""
                end
            end

            class ParameterError < StandardError
                def initialize(something)
                    super "Parameter Error when \"#{something}\""
                end
            end
        end
    end
end