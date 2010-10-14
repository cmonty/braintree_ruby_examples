# rails_tr_checkout

## Overview

This code is a demonstration of creating one time transactions using Braintree's
transparent redirect API. This example uses a custom form builder to
generate the HTML as well as display errors and repopulate the form
as necessary. See app/helpers/braintree_form_builder.rb.

## Getting Started

To run the example:

* Install the braintree gem (gem install braintree -v 2.3.1)
* Configure config/initializers/braintree.rb using your credentials.
  If you need access to the sandbox [contact Braintree](http://bit.ly/contact-braintree).
* `rails server`

