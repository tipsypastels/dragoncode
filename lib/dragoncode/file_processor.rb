# frozen_string_literal: true

module Dragoncode
  # Orchestrates the processing of an individual file.
  class FileProcessor
    attr_reader :file

    def initialize(file)
      @file = file
    end

    def start
      dump(transpiled_code)
    end

    private

    # Writes output to a file.
    def dump(out)
      puts out
    end

    # :nodoc:
    def transpiled_code
      @transpiled_code ||= Dragoncode::Transpiler.new(file).transpile
    end
  end
end
