#!/usr/bin/env ruby
require 'pry'
require_relative 'app'

def main
  app = App.new
  app.run
  binding.pry
end

main
