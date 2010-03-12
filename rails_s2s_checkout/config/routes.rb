ActionController::Routing::Routes.draw do |map|
  map.resources :payments, :only => [:new, :create]

  map.root :controller => "payments", :action => "new"
end

