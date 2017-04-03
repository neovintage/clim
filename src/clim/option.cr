class Clim
  class Option(T)
    property short : String
    property long : String
    property default : T
    property required : Bool
    property desc : String
    property value : T
    property exist : Bool

    def initialize(@short, @long, @default, @required, @desc, @value, @exist = false)
    end

    def short_name
      extract_name(short)
    end

    def long_name
      extract_name(long)
    end

    def name
      long.empty? ? short_name : long_name
    end

    def extract_name(name)
      name.split(/(\s|=)/).first.gsub(/^-*/, "")
    end

    def to_h
      {name => value}
    end

    def desc
      desc = @desc
      desc = desc + "  [default:#{@default}]" unless @default.to_s.empty?
      desc = desc + "  [required]" if @required
      desc
    end

    def set_value=(arg)
      @exist = true
      @value = arg
    end

    def add_value(arg)
      @exist = true
      @value << arg
    end

    def reset
      @exist = false
      @value = @default.dup
    end

    def invalid_required?
      required && !exist
    end
  end
end
