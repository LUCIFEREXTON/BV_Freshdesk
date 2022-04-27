require 'freshdesk'
Rails.application.routes.draw do
  app_name = Freshdesk.app || "freshdesk"
  namespace :api do
    namespace :v1 do
      namespace app_name.to_sym do
				get 'ticket/init_settings' => 'ticket#init_settings'
				get 'ticket/index' => 'ticket#index'
				post 'ticket/read' => 'ticket#read'
				get 'ticket/create' => 'ticket#new'
				post 'ticket/create' => 'ticket#create'
				put 'ticket/update/:id' => 'ticket#update'
				post 'ticket/reply/:id' => 'ticket#reply'
      end
    end
  end

  ticket_route = Freshdesk.routes

  get ticket_route, to:'homepage#index'
  get "#{ticket_route}/*other", to:'homepage#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
