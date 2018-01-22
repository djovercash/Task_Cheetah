Rails.application.routes.draw do
  resources :tasks
  resources :categories
  resources :users, except: [:index]
  resources :jobs

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  post '/tasks/:id/claim', to: 'tasks#claim', as: 'claim_task'
  post '/tasks/:id/approval', to: 'tasks#approval', as: 'approval_task'

  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
