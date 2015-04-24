#!/usr/bin/env ruby

require 'cirru/sepal'

file = ARGV[0]
unless defined? file
  raise 'enter file name'
end

code = IO::read file

rubyCode = Cirru::Sepal.compile code, file

# puts rubyCode

eval rubyCode
