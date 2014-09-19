Rails.application.routes.draw do
  resources :charities do
    resources :donations
  end
  root :to => "charities#index"
end
