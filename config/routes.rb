Kiwi::Application.routes.draw do
  resources :snippets, path: '/'

  match '/sass/compile' => 'sass#compile', via: :post

  root to: 'snippets#index'
end

