Kiwi::Application.routes.draw do
  resources :snippets, path: "/"
  root to: "snippets#index"
end

