require 'singleton'

module Tapp
  module Printer
    autoload :AwesomePrint, 'tapp/printer/awesome_print'
    autoload :PrettyPrint,  'tapp/printer/pretty_print'
    autoload :Puts,         'tapp/printer/puts'
    autoload :TablePrint,   'tapp/printer/table_print'

    def self.instance(name)
      case name
      when :pretty_print
        PrettyPrint.instance
      when :puts
        Puts.instance
      when :awesome_print
        AwesomePrint.instance
      when :table_print
        TablePrint.instance
      else
        raise ArgumentError, "Unknown printer: #{name.inspect}"
      end
    end

    class Base
      include Singleton

      def print(*args)
        raise NotImplementedError
      end
    end
  end
end
