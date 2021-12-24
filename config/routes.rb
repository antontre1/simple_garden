Rails.application.routes.draw do
  # get 'plants/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'gardens#index'
  resources :gardens do
    resources :plants, except: [:show] do
      collection do
        get :top
      end
    end
  end
  resources :plants, only: [:index, :show, :new, :edit, :create, :update]
end
