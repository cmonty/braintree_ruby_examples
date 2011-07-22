# What should this app do when we're done?


## Front Page (not logged in)

* Can create a user account
* Can log in

## Front Page (logged in) [WelcomeController#index]

* Show stored payment information (or lack thereof)
* Link to add/edit payment information
* Link to fake item to purchase using stored payment info
* List of past Transactions

## On add/edit form [PaymentInfoController#new,edit,confirm]

* See form with payment info (submits to BT)
* On errors, returned to form
* On success, returned to Front Page

## Fake Item page [PurchaseController#new,create; Product]

* Redirects to Front Page if no payment info stored
* Details on transaction to be run, with button to "Buy"

## Item Purchase confirmation page  [PurchaseController#show]

* Displays transaction summary
* Link back to Front Page
