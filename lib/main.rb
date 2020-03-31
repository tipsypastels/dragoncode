# frozen_string_literal: true

require 'zeitwerk'
require 'active_support/all'

loader = Zeitwerk::Loader.new
loader.push_dir('lib')
loader.setup

Dragoncode.start
