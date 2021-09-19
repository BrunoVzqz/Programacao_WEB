Rails.application.routes.draw do

  resources :agendamentos 
  resources :resultados
  resources :clinicas
  resources :exames

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'usuarios#create'
  get 'perfil', to:'usuarios#perfil'
   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
