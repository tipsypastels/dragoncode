# frozen_string_literal: true

module Dragoncode
  module Cmd
    # Outputs a msgbox line. <tt>Say</tt> is always wrapped in
    # a <tt>Msgbox</tt> by the grouping logic, which handles the
    # msgbox type and goto.
    class Say < Base
      parameters text: Text

      # :nodoc:
      def emit
        ".string \"#{params.text}\""
      end
    end
  end
end
