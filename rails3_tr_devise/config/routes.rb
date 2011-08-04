Rails3TrDevise::Application.routes.draw do
  devise_for :users

  resources :payment_info, :only => [:new, :edit]
  resources :credit_card_info, :only => [:edit]
  match 'payment_info/confirm' => 'payment_info#confirm', :as => :confirm_payment_info
  match 'credit_card_info/confirm' => 'credit_card_info#confirm', :as => :confirm_credit_card_info

  root :to => "welcome#index"
end
