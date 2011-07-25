Rails3TrDevise::Application.routes.draw do
  devise_for :users

  resources :payment_info, :only => [:new, :edit]
  match 'payment_info/confirm' => 'payment_info#confirm', :as => :confirm_payment_info

  root :to => "welcome#index"
end
