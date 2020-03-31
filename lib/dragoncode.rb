# frozen_string_literal: true

require 'active_support/all'

# :nodoc:
module Dragoncode
  VERSION = 0.1

  # Starts the Dragoncode process.
  def self.start
    Manager.new.start
  end
end
