ActionController::Routing::Routes.draw do |map|
  map.with_options :controller => "payments" do |p|
    p.new_payment "/payments/new", :action => "new"
    p.confirm_payment "/payments/confirm", :action => "confirm"
  end

  map.root :controller => "payments", :action => "new"
end

