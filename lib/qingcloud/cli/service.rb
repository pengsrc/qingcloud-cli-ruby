module QingCloud
    module Cli

        class Service

            SERVICE_MAP = {
                'describe-instances' => {
                    instances_N:     { type: String,  required: false },
                    image_id_N:      { type: String,  required: false },
                    instance_type_N: { type: String,  required: false },
                    status_N:        { type: String,  required: false },
                    search_word:     { type: String,  required: false },
                    verbose:         { type: Numeric, required: false },
                    offset:          { type: Numeric, required: false },
                    limit:           { type: Numeric, required: false },
                    zone:            { type: String,  required: true  },
                },

                'run-instances' => {
                    image_id:       { type: String,  required: true  },
                    instance_type:  { type: String,  required: false },
                    cpu:            { type: Numeric, required: false },
                    memory:         { type: Numeric, required: false },
                    count:          { type: Numeric, required: false },
                    instance_name:  { type: String,  required: false },
                    login_mode:     { type: String,  required: true },
                    login_keypair:  { type: String,  required: false },
                    login_passwd:   { type: String,  required: false },
                    vxnets_N:       { type: String,  required: false },
                    security_group: { type: String,  required: false },
                    volumes_N:      { type: String,  required: false },
                    need_newsid:    { type: Numeric, required: false },
                    need_userdata:  { type: Numeric, required: false },
                    userdata_type:  { type: String,  required: false },
                    userdata_value: { type: String,  required: false },
                    userdata_path:  { type: String,  required: false },
                    zone:           { type: String,  required: true },
                },

                'terminate-instances' => {
                    instances_N: { type: String, required: true },
                    zone:        { type: String, required: true },
                }
            }

        end

    end
end