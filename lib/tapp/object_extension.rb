require 'tapp/printer'
require 'tapp/util'

module Tapp
  module ObjectExtension
    def tapp(printer = Tapp.config.default_printer, *args)
      Tapp::Util.report_called if Tapp.config.report_caller
      tap {
        Tapp::Printer.instance(printer).print block_given? ? yield(self) : self, *args
      }
    end

    def taputs(&block)
      tapp :puts, &block
    end

    def tpp(*args, &block)
      tapp :table_print, *args, &block
    end

    def taap
      warn 'DEPRECATION WARNING: `taap` is deprecated. Set `Tapp.config.default_printer = :awesome_print` and use `tapp` instead.'

      tapp :awesome_print
    end
  end
end
