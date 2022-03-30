# Freshdesk

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/freshdesk`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'freshdesk'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install freshdesk

## Usage

1. Add `//= link freshdesk/manifest.js` inside file `app/assets/config/manifest.js` at the end.
2. Make a file `config/initializers/freshdesk.rb`
3. Copy following line of code
```
require 'freshdesk'

Freshdesk.config <Your Freshdesk Api key>, <Your freshdesk baseurl>
```

e.g. code 
```
require 'freshdesk'

Freshdesk.config "Bfjk4t0gjtgj98jt5hghg95h9==",'https://something-help.freshdesk.com'
```
4. Before making any api call to fetch, update, read, delete ticket you have to user's email

first import freshdesk `require 'freshdesk'` in the file you want to set user email
then `Freshdesk::UserCredentials.email = 'something@email.com'` to set email

(<i>Note: You can set this just after user gets login so that you don't have to set it just before api call</i>)

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/freshdesk. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/freshdesk/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Freshdesk project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/freshdesk/blob/master/CODE_OF_CONDUCT.md).
