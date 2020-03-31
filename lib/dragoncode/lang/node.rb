# frozen_string_literal: true

module Dragoncode
  module Lang
    # Represents a line of code.
    class Node
      attr_reader :text, :parent

      def initialize(text, parent)
        @text   = text
        @parent = parent
      end
    end
  end
end
