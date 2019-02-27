Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, :tags, :workspaces, :themes, :nuggets
      post 'signin', to: 'auth#create'
      get 'validate', to: 'users#validate'
      get 'content', to: 'users#get_content'
    end
  end
end
