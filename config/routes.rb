Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1, constraints: { format: 'json' } do
      resources :products, only: [:create]
    end
  end

  namespace :admin do
    resources :products, only: [:index, :edit, :show, :update]
  end
end
