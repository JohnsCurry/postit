PostitTemplate::Application.routes.draw do
  root to: 'posts#index'


  GET '/posts', to: 'posts#index'
  GET '/posts/:id', to: 'posts#show'
end
