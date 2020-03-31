module Dragoncode
  module Cmd
    class Base
      # :nodoc:
      def emit
        raise NotImplementedError, "The #{self.class.name} command does not implement abstract method #emit, which must be implemented by all commands. If you don't need custom emitting behavior, you can alias_method :emit, :auto_emit."
      end
    end
  end
end
