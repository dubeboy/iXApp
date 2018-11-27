Rails.application.routes.draw do
  root to: 'welcome#index'
  devise_for :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :students do
    resources :application_forms
  end

end
