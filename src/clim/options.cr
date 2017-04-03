require "./dsl"
require "./option"

class Clim
  class Options
    alias OptionsType = Option(String) | Option(Bool) | Option(Array(String))

    property opts : Array(OptionsType) = [] of OptionsType
    property help : String = ""

    def add(opt)
      raise ClimException.new "Empty short option." if opt.short_name.empty?
      raise ClimException.new "Duplicate option. \"-#{opt.short_name}\"" if opts.map(&.short_name).includes?(opt.short_name)
      raise ClimException.new "Duplicate option. \"--#{opt.long_name}\"" if opts.map(&.long_name).reject(&.empty?).includes?(opt.long_name)
      opts << opt
    end

    class Values
      property help : String = ""

      macro define_methods(*types)
        {% for type in types %}
          {% property_name = type.stringify.split("(").first.downcase %}

          property {{property_name.id}} : Hash(String, {{type.id}}) = {} of String => {{type.id}}

          def {{property_name.split("").first.id}}
            {{property_name.id}}
          end

          def merge!(hash : Hash(String, {{type.id}}))
            {{property_name.id}}.merge!(hash) do |key, _, _|
              raise ClimException.new "Duplicate {{property_name.id}} option. \"#{key}\""
            end
          end
        {% end %}
      end

      define_methods String, Bool, Array(String)
    end

    def values
      values = Values.new
      values.help = help
      opts.each do |opt|
        values.merge!(opt.to_h)
      end
      values
    end

    def reset
      opts.each(&.reset)
    end

    def exists_required!
      raise "Required options. \"#{invalid_required_names.join("\", \"")}\"" unless invalid_required_names.empty?
    end

    def invalid_required_names
      opts.map do |opt|
        opt.invalid_required? ? opt.short : nil
      end.compact
    end
  end
end
