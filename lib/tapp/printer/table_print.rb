require 'tapp/printer'
require 'table_print'

module Tapp::Printer
  class TablePrint < Base
    def print(*args)
      tp *args rescue nil
      puts "\n"
    end
  end
end