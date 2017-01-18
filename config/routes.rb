Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/estate' => 'estate#index', as: 'estate_index'
  get '/estate/:id' => 'estate#show', as: 'estate_show'

  get '/about' => 'welcome#about', as: 'about'
end
