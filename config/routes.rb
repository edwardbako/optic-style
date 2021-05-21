Rails.application.routes.draw do

  devise_for :users, controllers: {
               sessions: 'users/sessions',
               passwords: 'users/passwords'
                   }

  get 'admin' => 'admin#index'
  namespace :admin do
    resources :users, except: [:show]
    resources :branches, excepot: [:show] do
      scope module: :branches do
        resources :views, only: [:index, :create, :update, :destroy]
      end
    end

    namespace :clients do
      resources :phones , only: [:new, :destroy]
    end
    resources :clients do
      scope module: :clients do
        resources :orders
        resources :recipes
      end
    end

    resource :sms_mailing

    resources :products do
      scope module: :products do
        resources :views, only: [:index, :create, :update, :destroy]
      end
    end

    resources :posts, except: [:show]
    resources :grams, except: [:show]

    resources :articles do
      scope module: :articles do
        resources :blocks, only: [:create, :update, :destroy]
      end
    end

    resources :notifications
    resources :user_notifications, only: [:update]

  end

  resources :products, only: [:index, :show]
  resources :grams, only: [:index, :show]
  resources :posts, only: [:index]
  resources :articles, only: [:index, :show]

  resources :contacts, only: [:index, :show]

  post 'sms/callback' => 'sms#callback'

  get 'service' => 'welcome#service'

  get 'reviews' => 'welcome#reviews'

  get 'acuvue' => "welcome#acuvue"

  %w( 404 422 500 503).each do |code|
    get code, to: 'exceptions#show', code: code
  end

  constraints subdomain: 'mail' do
    get '/' => 'mail#index'
  end

  root to: 'welcome#index'
end
