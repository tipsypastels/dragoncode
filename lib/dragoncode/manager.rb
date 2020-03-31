# frozen_string_literal: true

module Dragoncode
  # The "main" execution loop of Dragoncode.
  class Manager
    def initialize
      @loader = Dragoncode::Loader.new
    end

    # Finds files and spawns a transpiler for each one.
    def start
      i = 0
      @loader.load_modified do |file|
        i += 1
        Dragoncode::FileProcessor.new(file).start
      end

      puts 'no files' if i.zero?
    end
  end
end
