Tumblepop::Application.routes.draw do
  
  match 'admin'=>'admin#index'
  namespace :admin do
    resources :asks do
      put :deliver, :on=>:member
    end
    resources :days
    resources :questions
    resources :reads do
      put :toggle, :on=>:member
    end
    resources :stories
    
    resources :users do
      put :toggle_admin, :on=>:member
    end
  end
  
  resources :stories
  resource  :user
  
  match 'login'=>'sessions#login'
  match 'logout'=>'sessions#logout'
  match 'authorize'=>'sessions#authorize'
  
  root :to=>'stories#index'
end
