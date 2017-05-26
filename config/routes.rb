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

    resources :posts, except: [:show]

  end

  resources :products, only: [:index, :show]
  resources :posts, only: [:index]

  get 'contacts' => 'welcome#contacts'
  get 'contacts/:id' => 'welcome#contacts', as: :contact

  get 'service' => 'welcome#service'

  get 'reviews' => 'welcome#reviews'

  %w( 404 422 500 503).each do |code|
    get code, to: 'exceptions#show', code: code
  end

  root to: 'welcome#index'
end
