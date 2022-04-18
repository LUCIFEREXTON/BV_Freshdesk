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
  5. Will add the javascript frontend files to your app in the app/javascript/Freshdesk_Essentials folder, from where you can edit the frontend as you desire.
  6. Will add a freshdesk.jsx file in app/javascript/packs folder which will act as the index file for the frontend.
```
require 'freshdesk'

#Freshdesk.config <Your Freshdesk Api key>, <Your freshdesk baseurl>, <React frontend routes>
e.g., 
#Freshdesk.config "Bfjk4t0gjtgj98jt5hghg",'https://something.freshdesk.com', '/tickets'
```

In the file `config/initializers/freshdesk.rb`, add your freshdesk api key, freshdesk url and the route which will be used by your frontend as shown in the e.g.

Before making any api call to fetch, update, and  read ticket you have to enter your customer's email
In the controller where your customer will be logged in do the following:

Import freshdesk `require 'freshdesk'`
then `Freshdesk::UserCredentials.set_email <User Email>` to set email

(<i>Tip: You can set this just after user gets login so that you don't have to set it just before api call</i>)

To add new fields for Ticket Creation Form, do the following steps:
  1. Go to your freshdesk dashboard.
  2. From the left navigation panel, select settings. (Note you need admin privileges to follow along after this.)
  3. Go to Workflows and click on Ticket Fields.
  4. There you will find some default fiedls and from the left panel you create your own custom field. They have 8 types from which you can choose.
  5. You can give the name and assign different labels for customer and agent for a field.
  6. If you want the field to be present in the Ticket Creation form, check the customer can edit checkbox.
  7. If you want the field to be mandatorily filled by your User, then check the Required when submitting the form checkbox.
  8. For dropdown custom field, please fill the dropdown choices fields, otherwise an empty dropdown list will be shown to the user in the creation form.

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
