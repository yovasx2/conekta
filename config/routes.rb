Rails.application.routes.draw do
  post  'accounts', to: 'accounts#create'
  post  'cards', to: 'cards#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
