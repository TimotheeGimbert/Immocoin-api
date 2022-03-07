Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  get '/member-data', to: 'users/members#show'
  match 'member-update', to: 'users/members#update', via: %i[patch put]
  resources :properties, except: %i[edit new]
end
