# frozen_string_literal: true

module Dragoncode
  # The main workhorse of Dragoncode, which handles the bulk of
  # transpiling work for each individual file. Accepts a file
  # or string which you can call <tt>#transpile</tt> on, e.g.,
  #
  #   Dragoncode::Transpiler.new(File.open("./some/file.drac")).transpile
  #   Dragoncode::Transpiler.new("script MyScript").transpile
  #
  class Transpiler
    attr_reader :body

    def initialize(body)
      @body = body.respond_to?(:read) ? body.read : body

      @parser      = Dragoncode::Parser.new
      @interpreter = Dragoncode::Interpreter.new
      @emitter     = Dragoncode::Emitter.new
    end

    # Performs parsing, interpreting, and emitting on the file body.
    # Returns a (hopefully) valid Pokemon script.
    def transpile
      code = @parser.parse(body)
      code = @interpreter.interpret(code)
      code = @emitter.emit(code)
      code
    end
  end
end
