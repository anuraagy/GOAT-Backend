Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :exercise_entries,  :except => [:new, :show, :edit]
      resources :exercise_types,    :except => [:new, :show, :edit, :edit, :destroy] do
        get 'search', :on => :collection
      end

      resources :food_entries,  :except => [:new, :show, :edit]
      resources :food_types,    :except => [:new, :show, :edit, :destroy] do
        get 'search', :on => :collection
      end

      resources :goals,            :except => [:new, :show, :edit]
      resources :item_types,       :except => [:create, :edit, :new, :show, :edit, :destroy]
      resources :purchased_items,  :except => [:edit, :new, :show, :edit, :destroy]

      resources :users,  :except => [:index, :update, :create, :edit, :new, :show, :edit, :destroy] do
        post 'sign_in', :to => "sign_in", :on => :collection
        post 'create',  :to => "create",  :on => :collection
      end
    end
  end
end
