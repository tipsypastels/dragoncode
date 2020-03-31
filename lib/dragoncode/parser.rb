# frozen_string_literal: true

module Dragoncode
  # Builds an AST from the raw script content.
  class Parser
    attr_reader :code

    def initialize(code)
      @code  = code
      @ast   = Dragoncode::Ast.new
      @lines = split_into_lines(code)
    end

    def parse
      
    end

    private

    COMMENT_REGEX = /#\s*(?=(?:[^\"]*\"[^\"]*\")*[^\"]*$).*$/.freeze

    def split_into_lines(code)
      lines = code.split(/\n/)
      out = []

      for i in 0...lines.size # rubocop:disable Style/For
        line = lines[i].strip.gsub(COMMENT_REGEX, '')

        if line.end_with?(',') && lines[i + 1]
          line += lines[i + 1]
          i += 1 # manual increment to skip next line
        end
      end

      out
    end
  end
end
