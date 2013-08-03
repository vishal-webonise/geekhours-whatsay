Whatsay::Application.routes.draw do
  match "/blah", :to => "pages#blah", :via => "get"
end

