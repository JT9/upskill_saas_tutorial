Rails.application.routes.draw do
  root to: 'pages#home'
  get 'about', to:'pages#about'
  resources :contacts, only: :create #only uses these two routes only: /contacts and /contact-us for POST request
  get 'contact-us', to: 'contacts#new', as: 'new_contact' #custom url for contacts page
end
