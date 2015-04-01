module QingCloud
    module Cli
        module Component

            class Job < Base

                def describe_jobs(
                    jobs={},
                    status={},
                    job_action=nil,
                    verbose=nil,
                    offset=nil,
                    limit=nil,
                    zone) eval(build_fetch_match)
                end

            end

        end
    end
end