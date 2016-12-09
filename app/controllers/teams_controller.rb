class TeamsController < ApplicationController
require 'open-uri'
require 'rubygems'
require 'json'


  def index
    @teams = Team.all

    render("teams/index.html.erb")
  end

  def standing
    @teams = Team.all


    standings_url = 'http://api.sportradar.us/nba-t3/seasontd/2016/REG/standings.json?api_key=vrgybsrq65r96gd242nhqyk2'




    parsed_standing_data = JSON.parse(open(standings_url).read)
    @api_standing = parsed_standing_data["conferences"]


    render("teams/standing.html.erb")
  end





  def show
    @team = Team.find(params[:id])

    render("teams/show.html.erb")
  end

  def new
    @team = Team.new

    render("teams/new.html.erb")
  end

  def create
    @team = Team.new

    @team.name = params[:name]
    @team.wins = params[:wins]
    @team.loses = params[:loses]
    @team.recordats = params[:recordats]

    save_status = @team.save

    if save_status == true
      redirect_to("/teams/#{@team.id}", :notice => "Team created successfully.")
    else
      render("teams/new.html.erb")
    end
  end

  def edit
    @team = Team.find(params[:id])

    render("teams/edit.html.erb")
  end

  def update
    @team = Team.find(params[:id])

    @team.name = params[:name]
    @team.wins = params[:wins]
    @team.loses = params[:loses]
    @team.recordats = params[:recordats]

    save_status = @team.save

    if save_status == true
      redirect_to("/teams/#{@team.id}", :notice => "Team updated successfully.")
    else
      render("teams/edit.html.erb")
    end
  end

  def destroy
    @team = Team.find(params[:id])

    @team.destroy

    if URI(request.referer).path == "/teams/#{@team.id}"
      redirect_to("/", :notice => "Team deleted.")
    else
      redirect_to(:back, :notice => "Team deleted.")
    end
  end
end
