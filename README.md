# Disallow

`disallow` gem is a utility for Ruby on Rails that allows you to restrict the usage of default scopes and callbacks in your ActiveRecord models. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'disallow'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install disallow

## Usage

### Callbacks

You can use this gem by just adding the methods to your model.

1. To disallow all callbacks in a model, use disallow_callbacks!:
```ruby
class MyModel < ActiveRecord::Base
  disallow_callbacks!

  before_save :do_something
  #=> raise Disallow::CallbackError
end
```

2. To disallow specific callbacks, use disallow_XXX_callbacks!, where XXX is the name of the callback:
```ruby
class MyModel < ActiveRecord::Base
  disallow_before_save_allbacks!
  disallow_after_create_callbacks!

  before_save :do_something
  #=> raise Disallow::CallbackError

  after_save :do_something
  #=> ok
end
```

### scopes

To disallow default scope definitions, use disallow_default_scope!:
```ruby
class MyModel < ActiveRecord::Base
  disallow_default_scope!
  default_scope { where(title: nil) }
  #=> raise Disallow::DefaultScopeError
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/a5-stable/disallow. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/disallow/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Disallow project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/a5-stable/disallow/blob/master/CODE_OF_CONDUCT.md).
