Kiwi::Application.routes.draw do
  resources :snippets, path: '/'
  match "/snippets/:id" => "snippets#show"
  match '/sass/compile' => 'sass#compile', via: :post

  root to: 'snippets#index'
end

