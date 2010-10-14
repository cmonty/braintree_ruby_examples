# rails_tr_checkout

## Overview

This code is a demonstration of creating one time transactions using Braintree's
transparent redirect API. This example uses a custom form builder to
generate the HTML as well as display errors and repopulate the form
as necessary. See app/helpers/application_helper.rb.

## Getting Started

To run the example:

* Install the braintree gem with bundler (`bundle install`)
* Configure config/initializers/braintree.rb using your credentials.
  If you need access to the sandbox [contact Braintree](http://bit.ly/contact-braintree).
* ruby script/server

