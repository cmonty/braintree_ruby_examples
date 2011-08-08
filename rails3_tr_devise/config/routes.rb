Rails3TrDevise::Application.routes.draw do
  devise_for :users

  resources :customer, :only => [:new, :edit]
  resources :credit_card_info, :only => [:edit]

  match 'customer/confirm' => 'customer#confirm', :as => :confirm_customer
  match 'credit_card_info/confirm' => 'credit_card_info#confirm', :as => :confirm_credit_card_info
  match 'trasactions/:product_id/new' => 'transactions#new', :as => :new_transaction
  match 'transactions/confirm/:product_id' => 'transactions#confirm', :as => :confirm_transaction

  root :to => "welcome#index"
end
