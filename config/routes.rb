Tumblepop::Application.routes.draw do
  
  match 'admin'=>'admin#index'
  namespace :admin do
    resources :asks
    resources :days
    resources :questions
    resources :stories
    
    resources :users do
      put :toggle_admin, :on=>:member
    end
  end
  
  resources :stories
  
  match 'login'=>'sessions#login'
  match 'logout'=>'sessions#logout'
  match 'authorize'=>'sessions#authorize'
  
  root :to=>'stories#index'
end
