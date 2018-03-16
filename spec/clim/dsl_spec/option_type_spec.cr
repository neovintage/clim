require "../dsl_spec"

{% begin %}
{%
  main_help_message = <<-HELP_MESSAGE

                        Command Line Interface Tool.

                        Usage:

                          main_command [options] [arguments]

                        Options:

                          --int8=VALUE                     Option description. [type:Int8]
                          --int8-default=VALUE             Option description. [type:Int8] [default:1]
                          --int16=VALUE                    Option description. [type:Int16]
                          --int32=VALUE                    Option description. [type:Int32]
                          --int64=VALUE                    Option description. [type:Int64]
                          --uint8=VALUE                    Option description. [type:UInt8]
                          --uint16=VALUE                   Option description. [type:UInt16]
                          --uint32=VALUE                   Option description. [type:UInt32]
                          --uint64=VALUE                   Option description. [type:UInt64]
                          --float32=VALUE                  Option description. [type:Float32]
                          --float64=VALUE                  Option description. [type:Float64]
                          --string=VALUE                   Option description. [type:String]
                          --bool                           Option description. [type:Bool]
                          --array-int8=VALUE               Option description. [type:Array(Int8)]
                          --array-int16=VALUE              Option description. [type:Array(Int16)]
                          --array-int32=VALUE              Option description. [type:Array(Int32)]
                          --array-int64=VALUE              Option description. [type:Array(Int64)]
                          --array-uint8=VALUE              Option description. [type:Array(UInt8)]
                          --array-uint16=VALUE             Option description. [type:Array(UInt16)]
                          --array-uint32=VALUE             Option description. [type:Array(UInt32)]
                          --array-uint64=VALUE             Option description. [type:Array(UInt64)]
                          --array-float32=VALUE            Option description. [type:Array(Float32)]
                          --array-float64=VALUE            Option description. [type:Array(Float64)]
                          --array-string=VALUE             Option description. [type:Array(String)]
                          --help                           Show this help.


                      HELP_MESSAGE
%}

spec(
  spec_class_name: OptionTypeSpec,
  spec_dsl_lines: [
    "option \"--int8=VALUE\", type: Int8",
    "option \"--int8-default=VALUE\", type: Int8, default: 1_i8",
    "option \"--int16=VALUE\", type: Int16",
    "option \"--int32=VALUE\", type: Int32",
    "option \"--int64=VALUE\", type: Int64",
    "option \"--uint8=VALUE\", type: UInt8",
    "option \"--uint16=VALUE\", type: UInt16",
    "option \"--uint32=VALUE\", type: UInt32",
    "option \"--uint64=VALUE\", type: UInt64",
    "option \"--float32=VALUE\", type: Float32",
    "option \"--float64=VALUE\", type: Float64",
    "option \"--string=VALUE\", type: String",
    "option \"--bool\", type: Bool",
    "option \"--array-int8=VALUE\", type: Array(Int8)",
    "option \"--array-int16=VALUE\", type: Array(Int16)",
    "option \"--array-int32=VALUE\", type: Array(Int32)",
    "option \"--array-int64=VALUE\", type: Array(Int64)",
    "option \"--array-uint8=VALUE\", type: Array(UInt8)",
    "option \"--array-uint16=VALUE\", type: Array(UInt16)",
    "option \"--array-uint32=VALUE\", type: Array(UInt32)",
    "option \"--array-uint64=VALUE\", type: Array(UInt64)",
    "option \"--array-float32=VALUE\", type: Array(Float32)",
    "option \"--array-float64=VALUE\", type: Array(Float64)",
    "option \"--array-string=VALUE\", type: Array(String)",
  ],
  spec_desc: "option type spec,",
  spec_cases: [
    {
      argv:        [] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Int8?,
        "method" => "int8",
        "expect_value" => nil,
      },
      expect_args: [] of String,
    },
    {
      argv:        ["--int8", "5"] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Int8?,
        "method" => "int8",
        "expect_value" => 5_i8,
      },
      expect_args: [] of String,
    },
    {
      argv:        [] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Int8,
        "method" => "int8_default",
        "expect_value" => 1_i8,
      },
      expect_args: [] of String,
    },
    {
      argv:        ["--int8-default", "5"] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Int8,
        "method" => "int8_default",
        "expect_value" => 5_i8,
      },
      expect_args: [] of String,
    },
    {
      argv:        [] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Int16?,
        "method" => "int16",
        "expect_value" => nil,
      },
      expect_args: [] of String,
    },
    {
      argv:        ["--int16", "5"] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Int16?,
        "method" => "int16",
        "expect_value" => 5_i16,
      },
      expect_args: [] of String,
    },
    {
      argv:        [] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Int32?,
        "method" => "int32",
        "expect_value" => nil,
      },
      expect_args: [] of String,
    },
    {
      argv:        ["--int32", "5"] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Int32?,
        "method" => "int32",
        "expect_value" => 5_i32,
      },
      expect_args: [] of String,
    },
    {
      argv:        [] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Int64?,
        "method" => "int64",
        "expect_value" => nil,
      },
      expect_args: [] of String,
    },
    {
      argv:        ["--int64", "5"] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Int64?,
        "method" => "int64",
        "expect_value" => 5_i64,
      },
      expect_args: [] of String,
    },
    {
      argv:        [] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => UInt8?,
        "method" => "uint8",
        "expect_value" => nil,
      },
      expect_args: [] of String,
    },
    {
      argv:        ["--uint8", "5"] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => UInt8?,
        "method" => "uint8",
        "expect_value" => 5_u8,
      },
      expect_args: [] of String,
    },
    {
      argv:        [] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => UInt16?,
        "method" => "uint16",
        "expect_value" => nil,
      },
      expect_args: [] of String,
    },
    {
      argv:        ["--uint16", "5"] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => UInt16?,
        "method" => "uint16",
        "expect_value" => 5_u16,
      },
      expect_args: [] of String,
    },
    {
      argv:        [] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => UInt32?,
        "method" => "uint32",
        "expect_value" => nil,
      },
      expect_args: [] of String,
    },
    {
      argv:        ["--uint32", "5"] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => UInt32?,
        "method" => "uint32",
        "expect_value" => 5_u32,
      },
      expect_args: [] of String,
    },
    {
      argv:        [] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => UInt64?,
        "method" => "uint64",
        "expect_value" => nil,
      },
      expect_args: [] of String,
    },
    {
      argv:        ["--uint64", "5"] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => UInt64?,
        "method" => "uint64",
        "expect_value" => 5_u64,
      },
      expect_args: [] of String,
    },

    {
      argv:        [] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Float32?,
        "method" => "float32",
        "expect_value" => nil,
      },
      expect_args: [] of String,
    },
    {
      argv:        ["--float32", "5.5"] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Float32?,
        "method" => "float32",
        "expect_value" => 5.5_f32,
      },
      expect_args: [] of String,
    },
    {
      argv:        [] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Float64?,
        "method" => "float64",
        "expect_value" => nil,
      },
      expect_args: [] of String,
    },
    {
      argv:        ["--float64", "5.5"] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Float64?,
        "method" => "float64",
        "expect_value" => 5.5_f64,
      },
      expect_args: [] of String,
    },
    {
      argv:        [] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => String?,
        "method" => "string",
        "expect_value" => nil,
      },
      expect_args: [] of String,
    },
    {
      argv:        ["--string", "5"] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => String?,
        "method" => "string",
        "expect_value" => "5",
      },
      expect_args: [] of String,
    },
    {
      argv:        [] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Bool?,
        "method" => "bool",
        "expect_value" => nil,
      },
      expect_args: [] of String,
    },
    {
      argv:        ["--bool"] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Bool?,
        "method" => "bool",
        "expect_value" => true,
      },
      expect_args: [] of String,
    },
    {
      argv:        [] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Array(Int8)?,
        "method" => "array_int8",
        "expect_value" => nil,
      },
      expect_args: [] of String,
    },
    {
      argv:        ["--array-int8", "1", "--array-int8", "2"],
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Array(Int8)?,
        "method" => "array_int8",
        "expect_value" => [1_i8, 2_i8],
      },
      expect_args: [] of String,
    },
    {
      argv:        [] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Array(Int16)?,
        "method" => "array_int16",
        "expect_value" => nil,
      },
      expect_args: [] of String,
    },
    {
      argv:        ["--array-int16", "1", "--array-int16", "2"],
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Array(Int16)?,
        "method" => "array_int16",
        "expect_value" => [1_i16, 2_i16],
      },
      expect_args: [] of String,
    },
    {
      argv:        [] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Array(Int32)?,
        "method" => "array_int32",
        "expect_value" => nil,
      },
      expect_args: [] of String,
    },
    {
      argv:        ["--array-int32", "1", "--array-int32", "2"],
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Array(Int32)?,
        "method" => "array_int32",
        "expect_value" => [1_i32, 2_i32],
      },
      expect_args: [] of String,
    },
    {
      argv:        [] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Array(Int64)?,
        "method" => "array_int64",
        "expect_value" => nil,
      },
      expect_args: [] of String,
    },
    {
      argv:        ["--array-int64", "1", "--array-int64", "2"],
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Array(Int64)?,
        "method" => "array_int64",
        "expect_value" => [1_i64, 2_i64],
      },
      expect_args: [] of String,
    },
    {
      argv:        [] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Array(UInt8)?,
        "method" => "array_uint8",
        "expect_value" => nil,
      },
      expect_args: [] of String,
    },
    {
      argv:        ["--array-uint8", "1", "--array-uint8", "2"],
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Array(UInt8)?,
        "method" => "array_uint8",
        "expect_value" => [1_u8, 2_u8],
      },
      expect_args: [] of String,
    },
    {
      argv:        [] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Array(UInt16)?,
        "method" => "array_uint16",
        "expect_value" => nil,
      },
      expect_args: [] of String,
    },
    {
      argv:        ["--array-uint16", "1", "--array-uint16", "2"],
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Array(UInt16)?,
        "method" => "array_uint16",
        "expect_value" => [1_u16, 2_u16],
      },
      expect_args: [] of String,
    },
    {
      argv:        [] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Array(UInt32)?,
        "method" => "array_uint32",
        "expect_value" => nil,
      },
      expect_args: [] of String,
    },
    {
      argv:        ["--array-uint32", "1", "--array-uint32", "2"],
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Array(UInt32)?,
        "method" => "array_uint32",
        "expect_value" => [1_u32, 2_u32],
      },
      expect_args: [] of String,
    },
    {
      argv:        [] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Array(UInt64)?,
        "method" => "array_uint64",
        "expect_value" => nil,
      },
      expect_args: [] of String,
    },
    {
      argv:        ["--array-uint64", "1", "--array-uint64", "2"],
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Array(UInt64)?,
        "method" => "array_uint64",
        "expect_value" => [1_u64, 2_u64],
      },
      expect_args: [] of String,
    },
    {
      argv:        [] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Array(Float32)?,
        "method" => "array_float32",
        "expect_value" => nil,
      },
      expect_args: [] of String,
    },
    {
      argv:        ["--array-float32", "1.1", "--array-float32", "2.2"],
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Array(Float32)?,
        "method" => "array_float32",
        "expect_value" => [1.1_f32, 2.2_f32],
      },
      expect_args: [] of String,
    },
    {
      argv:        [] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Array(Float64)?,
        "method" => "array_float64",
        "expect_value" => nil,
      },
      expect_args: [] of String,
    },
    {
      argv:        ["--array-float64", "1.1", "--array-float64", "2.2"],
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Array(Float64)?,
        "method" => "array_float64",
        "expect_value" => [1.1_f64, 2.2_f64],
      },
      expect_args: [] of String,
    },
    {
      argv:        [] of String,
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Array(String)?,
        "method" => "array_string",
        "expect_value" => nil,
      },
      expect_args: [] of String,
    },
    {
      argv:        ["--array-string", "array1", "--array-string", "array2"],
      expect_help: {{main_help_message}},
      expect_opts: {
        "type" => Array(String)?,
        "method" => "array_string",
        "expect_value" => ["array1", "array2"],
      },
      expect_args: [] of String,
    },
  ]
)
{% end %}