Rails.application.routes.draw do
  resources :messages
    namespace :api do
      namespace :v1 do
        get "/activity", to: "users#activity"
        post "/users", to: "users#create"
        post "/users/:user_id", to: "users#show"
        post "/login", to: "auth#log_in"
        get "/currentuser", to: "users#current_user"
        get "/myteams", to: "users#my_teams"
        post "/newteam", to: "teams#create"
        delete "/posts/:post_id", to: "posts#delete"
        patch "/likes/update/:like_id", to: "likes#updateSeen"
        patch "/replies/update/:reply_id", to: "replies#updateSeen"
        patch "/messages/update/:message_id", to: "messages#updateSeen"
        get "recentlyonline", to: 'users#recentlyOnline'
        delete "follows", to: 'follows#destroy'
        delete "likes", to: 'likes#destroy'
        get "notifications", to: 'users#notifications'
        patch "profilepicture", to: 'users#updateProfilePicture'
        resources :users
        resources :players
        resources :posts
        resources :teams
        resources :follows
        resources :game_cards
        resources :action_cards
        resources :replies
        resources :likes
        resources :messages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    end
  end
end
