Rails.application.routes.draw do
  #get 'books/index'
  #get 'books/new'
  #get 'books/edit'
  #get 'books/show'
  #post 'books', to: 'book#create'
  #root 'books#index'
  get 'books', to: 'books#index'
  root 'books#index'

  get 'books/new'
  post 'books', to: 'books#create'

  get 'books/:id', to: 'books#show', as: 'book'
  
  get 'books/:id/edit', to: 'books#edit', as: 'book_edit'
  patch 'books/:id', to: 'books#update'

  delete 'books/:id', to: 'books#destroy' 
end