module Dragoncode
  # A simple tree builder. It uses two arrays, <tt>#lines</tt> which is the
  # eventual output, and <tt>#chain</tt> which is a flat representation that
  # stores lines without nesting, which makes it easier to search for parents.
  class Ast
    attr_reader :lines, :chain

    def initialize
      @lines = []
      @chain = []
    end

    # Pushes a <tt>Lang::Node</tt> to its spot in the tree depending
    # on its indent.
    def push(node)

    end
  end
end
