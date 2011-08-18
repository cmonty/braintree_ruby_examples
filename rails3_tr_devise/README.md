# Using Devise with Braintree

## Overview
Explore this example for one way to integrate [Devise's][dev] account management with [Braintree's][brt] vault and payment gateway.

[dev]: https://github.com/plataformatec/devise
[brt]: http://www.braintreepayments.com

Included examples:

1. Creating Customer Data (including Payment Method) using Transparent Redirect
2. Linking Devise user with Braintree Customer
3. Using default Payment Information to purchase an item

## Getting Started
1. Download repository
2. `$ cd rails3_tr_devise`
3. `$ gem install bundler`
4. `$ bundle install`
5. `$ rake db:migrate`
6. `$ rake db:seed`
7. Edit `config/initializers/braintree.rb` with your Merchant ID and API keys. If you need access to the Sandbox [contact Braintree][contact]
8. `$ rails s`

[contact]: http://bit.ly/contact-braintree
