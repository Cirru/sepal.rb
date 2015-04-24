
# Cirru::Sepal

Expriment on compiling Cirru to Ruby.

### Idea

Based on this article: [Ruby AST for Fun and Profit][post]

[post]: https://www.igvita.com/2008/12/11/ruby-ast-for-fun-and-profit/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cirru-sepal'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install cirru-sepal
```

You may also get command `sepal.rb` for running Cirru files for Ruby AST.

```
sepal.rb demo.cirru
```

## Usage

Compiling Cirru code in to Ruby.

```ruby
require 'cirru/sepal'
rubyCode = Cirru::Sepal.compile code, file
```

Here is a glance of Cirru code for Ruby AST:

```cirru
lasgn a :1
lasgn b 1

call nil p (lvar a)

defn p2 (args x)
  call nil p (lvar x)

call nil p2 :demo

call nil p
  call (call 1 + 2) + 3
```

It compiles to(and then eval):

```ruby
a = "1"
b = 1

p(a)

def p2(x)
  p(x)
end

p2("demo")

p(((1 + 2) + 3))
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cirru-sepal/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
