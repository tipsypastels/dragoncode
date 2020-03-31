# frozen_string_literal: true

module Dragoncode
  # Provides an interface for customizing the language config per-project.
  # Dragoncode will look for a file named <tt>dragoncode.config.rb</tt> in the
  # root of your project (the same folder with the <tt>Makefile</tt>) and
  # autoload it before beginning compiling. If you must use a different location
  # you can pass it as a flag to the <tt>dragoncode</tt> command, e.g.,
  #
  #   dragoncode --config ./ruby/dragoncode.config.rb
  #
  # See <tt>self.configure</tt> below for examples on what to put in your
  # config file.
  module Config
    # File extension for Dragoncode files, without the leading <tt>.</tt>.
    # Default: :drac
    mattr_accessor :extension
    self.extension = :drac

    # What counts as a single indent.
    # Default: two spaces.
    mattr_accessor :indent
    self.indent = '  '

    # Whether to convert "..." to the single-character version used in Pokemon.
    # Default: false.
    mattr_accessor :convert_ellipsis
    self.convert_ellipsis = false

    # Charmap macros are functions that can be used in strings for substitution.
    # Each macro is a lambda that takes a single parameter and outputs the
    # emitted code.
    #
    # As an example, Gnosis uses macros to simplify color substitutions.
    #
    #   config.charmap_macros = {
    #     CHAR: -> match {
    #       "{COLOR CHARACTER_COLOR}#{match}{COLOR NO_COLOR}"
    #     },
    #     MON: -> match {
    #       "{COLOR POKEMON_COLOR}#{match}{COLOR NO_COLOR}"
    #     },
    #     PLACE: -> match {
    #       "{COLOR LOCATION_COLOR}#{match}{COLOR NO_COLOR}"
    #     },
    #   }
    #
    # You can then use your macros inside a Dragoncode string like so:
    #
    #   say "Hi CHAR(Zheng)! Welcome to the PLACE(Imperial City)!"
    #
    # You can insert game constants as well using <tt>({ })</tt>.
    #
    #   say "Hi CHAR({PLAYER})!"
    #
    # Note that Dragoncode cannot ensure that macros will produce
    # valid code for your game engine. For example, the constants
    # <tt>CHARACTER_COLOR</tt>, <tt>POKEMON_COLOR</tt> and
    # <tt>LOCATION_COLOR</tt> are specific to Pokemon Gnosis, and
    # do not exist in Pokemon Emerald, so attempting to use
    # them in a clean project will produce an error during make.
    #
    # For this reason, no macros are provided by default.
    mattr_accessor :charmap_macros
    self.charmap_macros = {}

    # Dragoncode supports "bare strings", which are script lines
    # with no actual command, just a string. For example:
    #
    #   script MyScript
    #     lock
    #       "Hello world!"
    #
    # By default, this bare string is identical to <tt>say "Hello world!"</tt>.
    # However, if you are using a different command for text, usually
    # <tt>sayraw</tt>,(which disables automatic formatting) you can
    # set bare strings to output that instead.
    mattr_accessor :bare_string_command
    self.bare_string_command = :say

    # Creates a block inside which you can configure Dragoncode.
    #
    #   Dragoncode::Config.configure do |config|
    #     config.indent = "\t" * 4
    #     config.convert_ellipsis = true
    #     config.charmap_macros = {
    #       RED: -> match {
    #         "{COLOR RED}#{match}{COLOR NO_COLOR}"
    #       }
    #     }
    #   end
    #
    def self.configure(&block)
      tap(&block)
    end
  end
end
