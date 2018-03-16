# clim

"clim" is slim command line interface builder for Crystal.

_"clim" = "cli" + "slim"_

[![Build Status](https://travis-ci.org/at-grandpa/clim.svg?branch=master)](https://travis-ci.org/at-grandpa/clim)

## Goals

* Slim implementation.
* Intuitive code.

## Support

- [x] Option types
  - [x] `Int8`
  - [x] `Int16`
  - [x] `Int32`
  - [x] `Int64`
  - [x] `UInt8`
  - [x] `UInt16`
  - [x] `UInt32`
  - [x] `UInt64`
  - [x] `Float32`
  - [x] `Float64`
  - [x] `String`
  - [x] `Bool`
  - [x] `Array(Int8)`
  - [x] `Array(Int16)`
  - [x] `Array(Int32)`
  - [x] `Array(Int64)`
  - [x] `Array(UInt8)`
  - [x] `Array(UInt16)`
  - [x] `Array(UInt32)`
  - [x] `Array(UInt64)`
  - [x] `Array(Float32)`
  - [x] `Array(Float64)`
  - [x] `Array(String)`
- [x] Default values for option
- [x] Required flag for option
- [x] Nested sub commands
- [x] `--help` option
- [x] `version` macro
- [x] Command name alias


## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  clim:
    github: at-grandpa/clim
    version: 0.2.0
```

## Sample Code (main command)

*src/hello.cr*

```crystal
require "clim"

module Hello
  class Cli < Clim

    # Following is the definition of main command.
    #
    main_command
    desc   "Hello CLI tool."
    usage  "hello [options] [arguments] ..."
    array  "-n NAME",  "--name=NAME",      desc: "Target name.",        default: [] of String
    string "-g WORDS", "--greeting=WORDS", desc: "Words of greetings.", default: "Hello"
    run do |opts, args|
      print "#{opts["greeting"].as(String)}, "
      print "#{opts["name"].as(Array(String)).join(", ")}!"
      print "\n"
    end

  end
end

Hello::Cli.start(ARGV)
```

```
$ crystal build src/hello.cr
$ ./hello --help

  Hello CLI tool.

  Usage:

    hello [options] [arguments] ...

  Options:

    --help                           Show this help.
    -n NAME, --name=NAME             Target name.  [default:[] of String]
    -g WORDS, --greeting=WORDS       Words of greetings.  [default:Hello]

$ ./hello -n Taro -n Miko -g 'Good night'
Good night, Taro, Miko!
```

## Sample Code (sub commands)

*src/fake-git.cr*

```crystal
require "clim"

module FakeGit
  class Cli < Clim

    # Following is the definition of main command.
    #
    main_command
    desc  "Fake Git command."
    usage "fgit [sub_command] [arguments]"
    run do |opts, args|
      puts opts["help"]
    end

    # A block that defines a sub command of the main command.
    #
    sub do

      # Following is the definition of command.
      #
      command "branch"
      alias_name "b", "br"
      desc  "List, create, or delete branches."
      usage "fgit branch [arguments]"
      run do |opts, args|
        puts "Fake Git branch!!"
      end

      command "log"
      alias_name "l"
      desc  "Show commit logs."
      usage "fgit log [arguments]"
      run do |opts, args|
        puts "Fake Git log!!"
      end

      # A block that defines a sub command of command "log".
      #
      sub do

        # Following is the definition of command.
        #
        command "short"
        desc  "Show commit short logs."
        usage "fgit log short [arguments]"
        run do |opts, args|
          puts "Fake Git short log!!"
        end

        command "long"
        desc  "Show commit long logs."
        usage "fgit log long [arguments]"
        run do |opts, args|
          puts "Fake Git long log!!"
        end

      end

    end

  end
end

FakeGit::Cli.start(ARGV)
```

```
$ crystal build -o ./fgit src/fake-git.cr
$ ./fgit

  Fake Git command.

  Usage:

    fgit [sub_command] [arguments]

  Options:

    --help                           Show this help.

  Sub Commands:

    branch, b, br   List, create, or delete branches.
    log, l          Show commit logs.

$ ./fgit br --help

  List, create, or delete branches.

  Usage:

    fgit branch [arguments]

  Options:

    --help                           Show this help.

$ ./fgit l --help

  Show commit logs.

  Usage:

    fgit log [arguments]

  Options:

    --help                           Show this help.

  Sub Commands:

    short   Show commit short logs.
    long    Show commit long logs.

$ ./fgit l short --help

  Show commit short logs.

  Usage:

    fgit log short [arguments]

  Options:

    --help                           Show this help.

$ ./fgit l short
Fake Git short log!!
```

## Usage

### require

```crystal
require "clim"
```

### Command Informations

#### alias_name

```crystal
  alias_name  "alias1", "alias2", "alias3"    # Command name alias.
```

#### desc

```crystal
  desc  "My Command Line Interface."          # Command description.
```

#### usage

```crystal
  usage  "mycli [sub-command] [options] ..."  # Command usage.
```

### Command Options

#### string

```crystal
  string "-s ARG", "--string-long-name=ARG", desc: "Option description."  # String option
  run do |opts, args|
    puts opts["string-long-name"]                     # => print your option value.
    puts typeof(opts["string-long-name"])             # => (Array(String) | Bool | String | Nil)
    puts typeof(opts["string-long-name"].as(String))  # => String
  end
```

#### bool

```crystal
  bool  "-b", "--bool-long-name", desc: "Option description."  # Bool option
  run do |opts, args|
    puts opts["bool-long-name"]                   # => print your option value.
    puts typeof(opts["bool-long-name"])           # => (Array(String) | Bool | String | Nil)
    puts typeof(opts["bool-long-name"].as(Bool))  # => Bool
  end
```

#### array

```crystal
  array "-a ITEM", "--array-long-name=ITEM", desc: "Option description."  # Array option
  run do |opts, args|
    puts opts["array-long-name"]                            # => print your option value.
    puts typeof(opts["array-long-name"])                    # => (Array(String) | Bool | String | Nil)
    puts typeof(opts["array-long-name"].as(Array(String)))  # => Array(String)
  end
```

### Option name

You can specify short name, long name or both.

see: [https://crystal-lang.org/api/OptionParser.html](https://crystal-lang.org/api/OptionParser.html)

#### Short name only

```crystal
  string "-s ARG", desc: "Option description." # String option
  run do |opts, args|
    puts opts["s"]                     # => print your option value.
    puts typeof(opts["s"])             # => (Array(String) | Bool | String | Nil)
    puts typeof(opts["s"].as(String))  # => String
    # puts opts["string-long-name"]    # => ERROR: Missing hash key: "string-long-name"
  end
```

#### Long name only

```crystal
  string "--string-long-name=ARG", desc: "Option description." # String option
  run do |opts, args|
    puts opts["string-long-name"]                     # => print your option value.
    puts typeof(opts["string-long-name"])             # => (Array(String) | Bool | String | Nil)
    puts typeof(opts["string-long-name"].as(String))  # => String
    # puts opts["s"]                                  # => ERROR: Missing hash key: "s"
  end
```


#### Both

If both are specified, the long name becomes the key.

```crystal
  string "-s ARG", "--string-long-name=ARG", desc: "Option description."  # String option
  run do |opts, args|
    puts opts["string-long-name"]                     # => print your option value.
    puts typeof(opts["string-long-name"])             # => (Array(String) | Bool | String | Nil)
    puts typeof(opts["string-long-name"].as(String))  # => String
    # puts opts["s"]                                  # => ERROR: Missing hash key: "s"
  end
```

### default / required

```crystal
  string "-s ARG",  "--string-long-name=ARG", default: "default value"               # Default value.
  bool   "-b",      "--bool-long-name",       required: true                         # Required.
  array  "-a ITEM", "--array-long-name=ITEM", default: [] of String, required: true  # Both.
```

### help

```crystal
  run do |opts, args|
    puts opts["help"].as(String)  # Get help string.
  end
```

## Development

```
$ crystal spec
```

## Contributing

1. Fork it ( https://github.com/at-grandpa/clim/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [at-grandpa](https://github.com/at-grandpa) at-grandpa - creator, maintainer
