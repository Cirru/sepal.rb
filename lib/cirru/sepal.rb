
require "cirru/sepal/version"
require 'cirru/parser'
require 'ruby2ruby'

module Cirru
  module Sepal
    def self.compile(code, file)
      tree = Cirru::Parser.pare code, file
      ast = program tree
      generateCode ast
    end
  end
end

def generateCode(ast)
  # p 'Ast:', ast
  ruby2ruby = Ruby2Ruby.new
  ruby2ruby.process ast
end

def program(tree)
  statements = tree.map do |line|
    transform line
  end
  s :block, *statements
end

def transform(tree)
  if tree.is_a? Array
    head = tree[0]
    body = tree[1..-1]
    list = body.map do |item|
      transform item
    end
    s parseToken(head), *list
  else # string then
    parseToken tree
  end
end

def parseToken(text)
  if text == 'nil'
    return nil
  end
  if text[0] == ':'
    return s(:str, text[1..-1])
  end
  if text =~ /^[+-.]?[\d\.]+/
    return s(:lit, text.to_i)
  end
  return text.to_sym
end
