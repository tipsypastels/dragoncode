# frozen_string_literal: true

require 'file/find'

module Dragoncode
  # Orchestrates the loading of Dragoncode files.
  class Loader
    # Finds all files with the Dragoncode extension
    # (default: <tt>drac</tt>) and passes them to
    # the given block.
    def load_all(&block)
      load_from_rule pattern: "*.#{extension}", &block
    end

    # Same as <tt>#load_all</tt>, but looks for a
    # <tt>.dragoncode_last_modified</tt> file in the project root
    # which contains a timestamp of the last time Dragoncode ran
    # successfully. Files modified since then will not be re-transpiled.
    def load_modified(&block)
      load_from_rule pattern: "*.#{extension}",
                     mtime: 'TODO',
                     &block
    end

    private

    # :nodoc:
    def load_from_rule(rule, &block)
      File::Find.new(rule).find(&block)
    end

    LAST_MODIFIED_FILE_NAME = '.dragoncode_last_modified'

    # :nodoc:
    def extension
      Dragoncode::Config.extension
    end
  end
end
