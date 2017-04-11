Rails.application.routes.draw do
  post  'accounts', to: 'accounts#create'
  post  'tokenize', to: 'cards#create'
  post  'charges', to: 'charges#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
