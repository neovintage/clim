require "./clim/*"

class Clim
  SUPPORT_TYPES_ALL_HASH = {
    Int8 => {
      type:                "number",
      default:             0,
      convert_arg_process: "arg.to_i8",
    },
    Int16 => {
      type:                "number",
      default:             0,
      convert_arg_process: "arg.to_i16",
    },
    Int32 => {
      type:                "number",
      default:             0,
      convert_arg_process: "arg.to_i32",
    },
    Int64 => {
      type:                "number",
      default:             0,
      convert_arg_process: "arg.to_i64",
    },
    UInt8 => {
      type:                "number",
      default:             0,
      convert_arg_process: "arg.to_u8",
    },
    UInt16 => {
      type:                "number",
      default:             0,
      convert_arg_process: "arg.to_u16",
    },
    UInt32 => {
      type:                "number",
      default:             0,
      convert_arg_process: "arg.to_u32",
    },
    UInt64 => {
      type:                "number",
      default:             0,
      convert_arg_process: "arg.to_u64",
    },
    Float32 => {
      type:                "number",
      default:             0.0,
      convert_arg_process: "arg.to_f32",
    },
    Float64 => {
      type:                "number",
      default:             0.0,
      convert_arg_process: "arg.to_f64",
    },
    String => {
      type:                "string",
      default:             "",
      convert_arg_process: "arg.to_s",
    },
    Bool => {
      type:    "bool",
      default: false,
    },
    Array(Int8) => {
      type:    "array",
      default: [] of Int8,
      convert_arg_process: "add_array_value(Int8, arg.to_i8)",
    },
    Array(Int16) => {
      type:    "array",
      default: [] of Int16,
      convert_arg_process: "add_array_value(Int16, arg.to_i16)",
    },
    Array(Int32) => {
      type:    "array",
      default: [] of Int32,
      convert_arg_process: "add_array_value(Int32, arg.to_i32)",
    },
    Array(Int64) => {
      type:    "array",
      default: [] of Int64,
      convert_arg_process: "add_array_value(Int64, arg.to_i64)",
    },
    Array(UInt8) => {
      type:    "array",
      default: [] of UInt8,
      convert_arg_process: "add_array_value(UInt8, arg.to_u8)",
    },
    Array(UInt16) => {
      type:    "array",
      default: [] of UInt16,
      convert_arg_process: "add_array_value(UInt16, arg.to_u16)",
    },
    Array(UInt32) => {
      type:    "array",
      default: [] of UInt32,
      convert_arg_process: "add_array_value(UInt32, arg.to_u32)",
    },
    Array(UInt64) => {
      type:    "array",
      default: [] of UInt64,
      convert_arg_process: "add_array_value(UInt64, arg.to_u64)",
    },
    Array(Float32) => {
      type:    "array",
      default: [] of Float32,
      convert_arg_process: "add_array_value(Float32, arg.to_f32)",
    },
    Array(Float64) => {
      type:    "array",
      default: [] of Float64,
      convert_arg_process: "add_array_value(Float64, arg.to_f64)",
    },
    Array(String) => {
      type:    "array",
      default: [] of String,
      convert_arg_process: "add_array_value(String, arg.to_s)",
    },
  }

  macro main_command(&block)

    Command.command "main_command_of_clim_library" do
      {{ yield }}
    end

    def self.start_parse(argv, io : IO = STDOUT)
      Command_Main_command_of_clim_library.new.parse(argv).run(io)
    end

    def self.start(argv)
      start_parse(argv)
    rescue ex : ClimException
      puts "ERROR: #{ex.message}"
    rescue ex : ClimInvalidOptionException
      puts "ERROR: #{ex.message}"
      puts ""
      puts "Please see the `--help`."
    end

    {% if @type.constants.map(&.id.stringify).includes?("Command_Main_command_of_clim_library") %}
      {% raise "Main command is already defined." %}
    {% end %}

  end
end
