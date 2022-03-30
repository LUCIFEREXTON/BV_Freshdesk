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
Run
`rails g freshdesk:install`

This command will do the following actions:
  1. Create a file `config/initializers/freshdesk.rb`
  2. Create or append a file `app/assets/config/manifest.js`
  3. Will Add `//= link freshdesk/manifest.js` inside file `app/assets/config/manifest.js` at the end.
  4. Will add  following line of code in `config/initializers/freshdesk.rb` that was created in step 1
```
require 'freshdesk'

#Freshdesk.config <Your Freshdesk Api key>, <Your freshdesk baseurl>
e.g., 
#Freshdesk.config "Bfjk4t0gjtgj98jt5hghg",'https://something.freshdesk.com'
```

In the file `config/initializers/freshdesk.rb`, add your freshdesk api key and freshdesk url as shown in the e.g.

Before making any api call to fetch, update, read, delete ticket you have to enter your customer's email
In the controller where your customer will be logged in do the following:

Import freshdesk `require 'freshdesk'`
then `Freshdesk::UserCredentials.set_email <User Email>` to set email

(<i>Tip: You can set this just after user gets login so that you don't have to set it just before api call</i>)

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

To change the frontend, open the `app/assets/javascripts/index.js` file and replace its content with your javascript pack code.
If your are using `webpacker` you can find your javascript pack code in `public/packs/js` folder. 
To find the current javascript pack file find its name in the `public/packs/manifest.json` file.

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/freshdesk. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/freshdesk/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Freshdesk project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/freshdesk/blob/master/CODE_OF_CONDUCT.md).
