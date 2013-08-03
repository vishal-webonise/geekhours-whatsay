Whatsay::Application.routes.draw do
  match "/blah", :to => "pages#blah", :via => "get"
  match "/after_login", :to => "pages#after_login", :via => "get"
end

