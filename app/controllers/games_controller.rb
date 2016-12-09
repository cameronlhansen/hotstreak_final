class GamesController < ApplicationController
  require 'open-uri'
  require 'rubygems'
  require 'json'

  def index
    @games = Game.all
    @time = Time.now.strftime("%Y/%m/%d")

    schedule_url = 'http://api.sportradar.us/nba-t3/games/'+@time+'/schedule.json?api_key=vrgybsrq65r96gd242nhqyk2'

    parsed_schedule_data = JSON.parse(open(schedule_url).read)
    @api_games = parsed_schedule_data["games"]

    render("games/index.html.erb")
  end

  def show
    @game = Game.find(params[:id])
    @game_picks = Pick.where({ :game_id => Game.find(params[:id]).id})



    render("games/show.html.erb")
  end

  def new
    @game = Game.new
    @time = Time.now.strftime("%Y/%m/%d")

    schedule_url = 'http://api.sportradar.us/nba-t3/games/'+@time+'/schedule.json?api_key=vrgybsrq65r96gd242nhqyk2'

    parsed_schedule_data = JSON.parse(open(schedule_url).read)
    @api_games = parsed_schedule_data["games"]




    render("games/new.html.erb")
  end

  def create
    @game = Game.new

    @game.game_date = params[:game_date]
    @game.game_time = params[:game_time]
    @game.favorite_id = params[:favorite_id]
    @game.underdog_id = params[:underdog_id]
    @game.home_team_id = params[:home_team_id]
    @game.spread = params[:spread]
    @game.final_favorite_score = params[:final_favorite_score]
    @game.final_underdog_score = params[:final_underdog_score]

    save_status = @game.save

    if save_status == true
      redirect_to("/games/", :notice => "Game created successfully.")
    else
      render("games/new.html.erb")
    end
  end

  def edit
    @game = Game.find(params[:id])

    @time = Time.now.yesterday.strftime("%Y/%m/%d")

    schedule_url = 'http://api.sportradar.us/nba-t3/games/'+@time+'/schedule.json?api_key=vrgybsrq65r96gd242nhqyk2'

    parsed_schedule_data = JSON.parse(open(schedule_url).read)
    @api_games = parsed_schedule_data["games"]

    render("games/edit.html.erb")
  end

  def update
    @game = Game.find(params[:id])

    @game.game_date = params[:game_date]
    @game.game_time = params[:game_time]
    @game.favorite_id = params[:favorite_id]
    @game.underdog_id = params[:underdog_id]
    @game.home_team_id = params[:home_team_id]
    @game.spread = params[:spread]
    @game.final_favorite_score = params[:final_favorite_score]
    @game.final_underdog_score = params[:final_underdog_score]

    save_status = @game.save

    if save_status == true
      redirect_to("/games/", :notice => "Game updated successfully.")
    else
      render("games/edit.html.erb")
    end
  end

  def edit_score
    @game = Game.find(params[:id])

    @time = Time.now.yesterday.strftime("%Y/%m/%d")

    schedule_url = 'http://api.sportradar.us/nba-t3/games/'+@time+'/schedule.json?api_key=vrgybsrq65r96gd242nhqyk2'

    parsed_schedule_data = JSON.parse(open(schedule_url).read)
    @api_games = parsed_schedule_data["games"]

    render("games/update_score.html.erb")
  end



  def update_score
    @game = Game.find(params[:id])

    @game.game_date = params[:game_date]
    @game.game_time = params[:game_time]
    @game.favorite_id = params[:favorite_id]
    @game.underdog_id = params[:underdog_id]
    @game.home_team_id = params[:home_team_id]
    @game.spread = params[:spread]
    @game.final_favorite_score = params[:final_favorite_score]
    @game.final_underdog_score = params[:final_underdog_score]

    save_status = @game.save

    if save_status == true
      redirect_to("/games/", :notice => "Game updated successfully.")
    else
      render("games/edit.html.erb")
    end
  end




  def destroy
    @game = Game.find(params[:id])

    @game.destroy

    if URI(request.referer).path == "/games/#{@game.id}"
      redirect_to("/", :notice => "Game deleted.")
    else
      redirect_to(:back, :notice => "Game deleted.")
    end
  end
end
