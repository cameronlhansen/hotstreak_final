Rails.application.routes.draw do

  devise_for :users
  #Devise
  root 'games#index'

  # Routes for the Pick resource:
  # CREATE

  # Make a Pick

  get "/make_pick/:game_id", :controller => "picks", :action => "pick_page"

  get "/picks/new", :controller => "picks", :action => "new"
  post "/create_pick", :controller => "picks", :action => "create"

  # READ
  get "/picks", :controller => "picks", :action => "index"
  get "/picks/:id", :controller => "picks", :action => "show"

  # UPDATE
  get "/picks/:id/edit", :controller => "picks", :action => "edit"
  post "/update_pick/:id", :controller => "picks", :action => "update"

  # DELETE
  get "/delete_pick/:id", :controller => "picks", :action => "destroy"

  # UPDATE RESULTS
  get "/update_results", :controller => "picks", :action => "update_results"



  #------------------------------

  # Routes for the Game resource:
  # CREATE

  get "/games/new", :controller => "games", :action => "new"
  post "/create_game", :controller => "games", :action => "create"

  # READ
  get "/games", :controller => "games", :action => "index"
  get "/games/:id", :controller => "games", :action => "show"

  # UPDATE
  get "/games/:id/edit", :controller => "games", :action => "edit"
  post "/update_game/:id", :controller => "games", :action => "update"

  get "/games/update_score/:id", :controller => "games", :action => "edit_score"
  post "/update_score/:id", :controller => "games", :action => "update_score"


  # DELETE
  get "/delete_game/:id", :controller => "games", :action => "destroy"
  #------------------------------

  # Routes for the Team resource:
  # CREATE
  get "/teams/new", :controller => "teams", :action => "new"
  post "/create_team", :controller => "teams", :action => "create"

    # Standings
    get "/teams/standings", :controller => "teams", :action => "standing"


  # READ
  get "/teams", :controller => "teams", :action => "index"
  get "/teams/:id", :controller => "teams", :action => "show"

  # UPDATE
  get "/teams/:id/edit", :controller => "teams", :action => "edit"
  post "/update_team/:id", :controller => "teams", :action => "update"

  # DELETE
  get "/delete_team/:id", :controller => "teams", :action => "destroy"




  #------------------------------

  # Routes for the User resource:
  get "/users/index", :controller => "users", :action => "index"




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
