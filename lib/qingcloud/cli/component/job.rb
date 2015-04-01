module QingCloud
    module Cli
        module Component

            class Job < Base

                attr_accessor :action
                attr_accessor :job_set
                attr_accessor :total_count

                def describe_jobs(jobs={},
                                  status={},
                                  job_action=nil,
                                  verbose=nil,
                                  offset=nil,
                                  limit=nil,
                                  zone)
                    params = {}

                    params.update(jobs: jobs) if jobs.length > 0
                    params.update(status: status) if status.length > 0
                    params.update(job_action: job_action) if job_action
                    params.update(verbose: verbose) if verbose
                    params.update(offset: offset) if offset
                    params.update(limit: limit) if limit
                    params.update(zone: zone) if zone

                    response_body = fetch_response 'DescribeJobs', params

                    self.action = response_body['action']
                    self.job_set = response_body['job_set']
                    self.total_count = response_body['total_count']
                end

            end

        end
    end
end