Rails3TrCheckout::Application.routes.draw do
  match 'payments/new' => 'payments#new', :as => :new_payment
  match 'payments/confirm' => 'payments#confirm', :as => :confirm_payment

  root :to => "payments#new"
end
