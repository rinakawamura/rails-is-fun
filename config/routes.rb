Rails.application.routes.draw do
  delete "/author_books/:book_id/:author_id", to: "author_books#destroy"
  resources :author_books, except: [:destroy]
  resources :authors
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
