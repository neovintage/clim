require "./command"

class Clim
  alias ReturnOptsType = Hash(String, String | Bool | Array(String) | Nil)
  {% if flag?(:spec) %}
    alias ReturnTypeOfRunBlock = NamedTuple(opts: ReturnOptsType, args: Array(String))
    alias RunProc = Proc(ReturnOptsType, Array(String), ReturnTypeOfRunBlock)
  {% else %}
    alias RunProc = Proc(ReturnOptsType, Array(String), Nil)
  {% end %}

  @@main : Command = Command.new("main_command")
  @@defining_command : Command = @@main
  @@command_stack : Array(Command) = [] of Command

  module Dsl
    def main_command
      raise ClimException.new "Main command is already defined." unless @@command_stack.empty?
      @@main = Command.new("main_command")
      @@defining_command = @@main
    end

    def command(name)
      raise ClimException.new "Main command is not defined." if @@command_stack.empty?
      @@defining_command = Command.new(name)
    end

    def desc(desc)
      @@defining_command.desc = desc
    end

    def usage(usage)
      @@defining_command.usage = usage
    end

    macro difine_opts(method_name, type, &proc)
      {% for long? in [true, false] %}
        def {{method_name.id}}(short, {% if long? %} long, {% end %} default : {{type}} = nil, required = false, desc = "Option description.")
          opt = Option({{type}}).new(
                                      short:    short,
                                      long:     {% if long? %} long, {% else %} "", {% end %}
                                      default:  default,
                                      required: required,
                                      desc:     desc,
                                      value:    default
                                    )
          @@defining_command.add_opt(opt) {{proc.id}}
        end
      {% end %}
    end

    difine_opts(method_name: "string", type: String | Nil) { |arg| opt.set_string(arg) }
    difine_opts(method_name: "bool", type: Bool | Nil) { |arg| opt.set_bool(arg) }
    difine_opts(method_name: "array", type: Array(String) | Nil) { |arg| opt.add_to_array(arg) }

    def run(&block : RunProc)
      @@defining_command.run_proc = block
      @@command_stack.last.sub_cmds << @@defining_command unless @@command_stack.empty?
    end

    def sub(&block)
      @@command_stack.push(@@defining_command)
      yield
      @@command_stack.pop
    end

    def start_main(argv)
      @@main.parse_and_run(argv)
    end

    def start(argv)
      start_main(argv)
    rescue ex
      puts ex.message
    end
  end
end
