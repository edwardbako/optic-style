Rails.application.routes.draw do

  devise_for :users, controllers: {
               sessions: 'users/sessions',
               passwords: 'users/passwords'
                   }

  get 'admin' => 'admin#index'
  namespace :admin do
    resources :users, except: [:show]
    resources :products, except: [:show] do
      scope module: :products do
        resources :views, only: [:index, :create, :update, :destroy]
      end
    end

  end

  resources :products, only: [:index, :show]

  get 'contacts' => 'welcome#contacts'
  get 'contacts/:id' => 'welcome#contacts', as: :contact

  get 'service' => 'welcome#service'

  root to: 'welcome#index'
end
