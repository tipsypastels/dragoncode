# frozen_string_literal: true

module Dragoncode
  module Param
    # Represents a text (string) parameter to a command.
    class Text < Base
      def to_s
        "\"#{super}\"" # TODO charmaps etc
      end
    end
  end
end
