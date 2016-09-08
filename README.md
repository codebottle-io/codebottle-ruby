# Codebottle [![Build Status](https://travis-ci.org/codebottle-io/codebottle-ruby.svg?branch=master)](https://travis-ci.org/codebottle-io/codebottle-ruby)

A Ruby library to interact with CodeBottle's API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'codebottle'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install codebottle

## Usage

```ruby
require "codebottle"

search = Codebottle.search(keywords: "test", limit: 2)
get = Codebottle.get(id: "3467598b")
browse = Codebottle.browse(order: 1, limit: 2)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/codebottle-io/codebottle-ruby.

