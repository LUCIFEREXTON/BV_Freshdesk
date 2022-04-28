# Freshdesk

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/freshdesk`. To experiment with that code, run `bin/console` for an interactive prompt.

[Documentation and other important links](https://docs.google.com/document/d/1lHf5oPygSfTt02e2TDwgpCZPNpw9CKv6XXSXRyiw92A/edit?usp=sharing)

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
  2. Will add the javascript frontend files to your app in the app/javascript/Freshdesk_Essentials folder, from where you can edit the frontend as you desire.
  3. Will add a freshdesk.jsx file in app/javascript/packs folder which will act as the index file for the frontend.
  4. will install necessary packages for the React frontend.
```
The contents of the `config/initializers/freshdesk.rb` will be:

require 'freshdesk'

#Freshdesk.config <App Name>, <Your Freshdesk Api key>, <Your freshdesk baseurl>, <React frontend routes>
e.g., 
#Freshdesk.config "freshdesk", "Bfjk4t0gjtgj98jt5hghg",'https://something.freshdesk.com', '/tickets'
```

In the file `config/initializers/freshdesk.rb`, add name of the app where your tickets are stored, api key, url of the app where your tickets are stored and the route which will be used by your frontend as shown in the e.g.

Before making any api call to fetch, update, and  read ticket you have to enter your customer's email
In the application controller do the following:

Create the following method:

```
def load_user_defaults
  @email = <Email of the user>
end

```

For e.g., 
```
  private

  def load_user_defaults
    if current_user.present?
      @email = current_user.email
      @user_details = { 
	:gid => "12345", 
	:name => current_user.email
      }
      @user_blog_uri = [
	"https://google.com",
        "https://facebook.com",
        "https://youtube.com",
        "https://twitter.com",
        "https://amazon.com",
        "https://blogvault.net"
      ]
      @per_page = 10
      @tickets_per_request = 100
    end
  end
```

In the above method: 
  1. @email stores email of the user
  2. @user_details stores name of the user and other details which you want to store in freshdesk dashboard.
  3. @user_blog_uri stores the blog uri list.
  4. @per_page stores the number of tickets you want to show in a page in frontend.
  5. @tickets_per_request stores number of tickets to fetch per api call.

To add new controllers to the existing controllers follow the below steps:
  1. In your app create a new controller in the following path `app/controllers/api/v1/freshdesk`.
  2. The controller should inherit from the `Api::V1::Freshdesk::TicketController`.
  3. Below is a sample controller:
  ```
  class Api::V1::Freshdesk::CustomController < Api::V1::Freshdesk::TicketController
  end
  ```
  4. Go to the config/routes.rb file and add your routes like this:
  ```
  namespace :api do
    namespace :v1 do
      namespace :freshdesk do
        <your routes>
      end
    end
  end
  ```

(<i>Tip: You can set this just after user gets login so that you don't have to set it just before api call</i>)

To add new fields for Ticket Creation Form, do the following steps:
  1. Go to your freshdesk dashboard.
  2. From the left navigation panel, select settings. (Note you need admin privileges to follow along after this.)
  3. Go to Workflows and click on Ticket Fields.
  4. There you will find some default fields and from the left panel you create your own custom field. They have 8 types from which you can choose.
  5. You can give the name and assign different labels for customer and agent for a field.
  6. If you want the field to be present in the Ticket Creation form, check the customer can edit checkbox.
  7. If you want the field to be mandatorily filled by your User, then check the Required when submitting the form checkbox.
  8. For dropdown custom field, please fill the dropdown choices fields, otherwise an empty dropdown list will be shown to the user in the creation form.

To add new fields for User in the freshdesk, do the following:
  1. Go to your freshdesk dashboard.
  2. From the lef navigation panel, select setting. (Note you need admin privileges to follow along after this.)
  3. Go to Support Operations and click on Customer Fields.
  4. There you will find some default fields and from the top panel you can create your own custom field.
  5. You can give the name to the custom field.
  6. To see which fields to be shown to agent about the customer click on Customize on the top panel and select the required fields.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

To change the javascript code of the gem, go to	`lib/generators/freshdesk/templates`.
In that folder freshdesk.jsx is the index file of the frontend.
And Freshdesk_Essentials is the folder containing all the components of the frontend.
Feel free to customize it.

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/freshdesk. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/freshdesk/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Freshdesk project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/freshdesk/blob/master/CODE_OF_CONDUCT.md).
