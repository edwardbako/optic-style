Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'contacts' => 'welcome#contacts'
  get 'contacts/:id' => 'welcome#contacts', as: :contact

  get 'service' => 'welcome#service'

  root to: 'welcome#index'
end
