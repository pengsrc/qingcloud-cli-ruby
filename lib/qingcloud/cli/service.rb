module QingCloud
    module Cli

        class Service

            SERVICE_MAP = {
                'describe-instances' => {
                    description: 'Usage: qingcloud describe-instances [options]',
                    options: [
                        { full: 'instances',     short: 'i', type: String,  is_array: true,  required: false, description: 'the IDs of instances you want to describe' },
                        { full: 'image_id',      short: 'm', type: String,  is_array: true,  required: false, description: 'the image id of instances' },
                        { full: 'instance_type', short: 't', type: String,  is_array: true,  required: false, description: 'instance type: small_b/c, medium_a/b/c, large_a/b/c' },
                        { full: 'status',        short: 's', type: String,  is_array: true,  required: false, description: 'instance status: pending, running, stopped, terminated, ceased' },
                        { full: 'search_word',   short: 'W', type: String,  is_array: false, required: false, description: 'the combined search column' },
                        { full: 'verbose',       short: 'V', type: Numeric, is_array: false, required: false, description: 'the number to specify the verbose level' },
                        { full: 'offset',        short: 'O', type: Numeric, is_array: false, required: false, description: 'the starting offset of the returning results' },
                        { full: 'limit',         short: 'L', type: Numeric, is_array: false, required: false, description: 'specify the number of the returning results' },
                        { full: 'zone',          short: 'z', type: String,  is_array: false, required: true , description: 'the ID of zone you want to access' },
                    ]
                },

                'run-instances' => {
                    description: 'Usage: qingcloud run-instances [options]',
                    options: [
                        { full: 'image_id',       short: 'm', type: String,  is_array: false, required: true , description:'image ID' },
                        { full: 'instance_type',  short: 't', type: String,  is_array: false, required: false, description:'instance type: small_b/c, medium_a/b/c, large_a/b/c' },
                        { full: 'cpu',            short: 'C', type: Numeric, is_array: false, required: false, description:'cpu core: 1, 2, 4, 8, 16' },
                        { full: 'memory',         short: 'M', type: Numeric, is_array: false, required: false, description:'memory size in MB: 512, 1024, 2048, 4096, 8192, 16384' },
                        { full: 'count',          short: 'c', type: Numeric, is_array: false, required: false, description:'the number of instances to launch, default 1' },
                        { full: 'instance_name',  short: 'N', type: String,  is_array: false, required: false, description:'instance name' },
                        { full: 'login_mode',     short: 'l', type: String,  is_array: false, required: true , description:'SSH login mode: keypair or passwd' },
                        { full: 'login_keypair',  short: 'k', type: String,  is_array: false, required: false, description:'login_keypair, should specified when SSH login mode is "keypair"' },
                        { full: 'login_passwd',   short: 'p', type: String,  is_array: false, required: false, description:'login_passwd, should specified when SSH login mode is "passwd"' },
                        { full: 'vxnets',         short: 'n', type: String,  is_array: true,  required: false, description:'specifies the IDs of vxnets the instance will join' },
                        { full: 'security_group', short: 's', type: String,  is_array: false, required: false, description:'the ID of security group that will be applied to instance' },
                        { full: 'zone',           short: 'z', type: String,  is_array: false, required: true , description:'the ID of zone you want to access' },
                    ]
                },

                'terminate-instances' => {
                    description: 'Usage: qingcloud terminate-instances [options]',
                    options: [
                        { full: 'instances', short: 'i', type: String,  is_array: true, required: true, description:'the IDs of instances you want to terminate' },
                        { full: 'zone',      short: 'z', type: String,  is_array: false, required: true, description:'the ID of zone you want to access' },
                    ]
                }
            }

        end

    end
end