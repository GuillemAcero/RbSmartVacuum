Rails.application.routes.draw do
  
  post 'init', to: 'room#init'
  post 'get_dead_ends', to: 'room#get_dead_ends'
  get 'get_all', to: 'room#get_all'

end
