Rails.application.routes.draw do
  devise_for :users
  root :to => "home#top"
  resources :users, :only => [:index, :show]
  resources :blogs do
    resources :comments, only: [:create, :destroy]
  end
  resources :contacts
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'
  get 'mypage', to: 'home#mypage'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
