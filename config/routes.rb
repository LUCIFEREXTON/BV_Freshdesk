require 'freshdesk'
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'ticket/init_settings' => 'ticket#init_settings'
      get 'ticket/index' => 'ticket#index'
      post 'ticket/read' => 'ticket#read'
      get 'ticket/create' => 'ticket#new'
      post 'ticket/create' => 'ticket#create'
      put 'ticket/update/:id' => 'ticket#update'
      post 'ticket/reply/:id' => 'ticket#reply'
      get 'ticket/blog_uri_list' => 'ticket#blog_uri_list'
    end
  end
  get "#{Freshdesk.routes}", to:'homepage#index'
  get "#{Freshdesk.routes}/*other", to:'homepage#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
