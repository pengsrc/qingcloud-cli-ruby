# QingCloud::Cli

Command line tool for QingCloud

## Install

This tool(gem) is not ready, you can only install it from source code. It'll be published to [RubyGems](https://rubygems.org) when it's ok.

Get Code from Github:

	$ git clone git@github.com:prettyxw/qingcloud-cli-ruby.git

Build and Install with Bundle:

    $ cd qingcloud-cli-ruby
    $ bundle install
    $ bundle exec rake install

## Uninstall

	$ gem uninstall qingcloud-cli
	
## Getting Started

After install this command line tool, just bring up your terminal and give it a try.

```bash
$ qingcloud
Usage: qingcloud <action> [options]

Available actions:

describe-instances
run-instances
terminate-instances
```

```bash
$ qingcloud describe-instances
Usage: qingcloud describe-instances [options]

Specific options:
    -i, --instances INSTANCES        the IDs of instances you want to describe
    -m, --image_id IMAGE_ID          the image id of instances
    -t INSTANCE_TYPE,                instance type: small_b/c, medium_a/b/c, large_a/b/c
        --instance_type
    -s, --status STATUS              instance status: pending, running, stopped, terminated, ceased
    -W, --search_word SEARCH_WORD    the combined search column
    -V, --verbose VERBOSE            the number to specify the verbose level
    -O, --offset OFFSET              the starting offset of the returning results
    -L, --limit LIMIT                specify the number of the returning results
    -z, --zone ZONE                  the ID of zone you want to access
    -h, --help                       show help message
    -I, --interactive                use command line tool interactively
```


## Contributing

1. Fork it ( https://github.com/prettyxw/qingcloud-cli-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

LICENSE
-------
The GPL License. Read [GNU General Public License](http://www.gnu.org/licenses/gpl.html) for further information.