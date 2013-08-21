Wow::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'users/registrations' }

  resources :users do
    member do
      get 'new_character'
      get 'users_details' => 'users#usersDetails', as: 'users_details'
    end
  end

  resources :equipment do
    collection do
      get 'equip_class/:klass/equip_part/:part' => 'equipment#pop_equip', as: 'klass_part'
      get 'equip_class/:klass' => 'users#index', as: 'choose_class'
    end
  end

  root :to => 'users#index'
end
