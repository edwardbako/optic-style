Rails.application.routes.draw do

  devise_for :users, controllers: {
               sessions: 'users/sessions',
               passwords: 'users/passwords'
                   }

  namespace :admin do
    resources :users, except: [:show]
  end
  get 'admin' => 'admin#index'

  resources :products

  get 'contacts' => 'welcome#contacts'
  get 'contacts/:id' => 'welcome#contacts', as: :contact

  get 'service' => 'welcome#service'

  root to: 'welcome#index'
end
