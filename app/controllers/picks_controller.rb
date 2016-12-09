class PicksController < ApplicationController

  def pick_page
    @game = Game.find(params[:game_id])

    render("picks/pick_page.html.erb")
  end



  def index

    id = current_user.id
    @my_picks = Pick.where({ :user_id => id})

    @my_correct_picks = Pick.where({ :user_id => id, :final_result => "Correct"})
    @my_incorrect_picks = Pick.where({ :user_id => id, :final_result => "Not Correct"})

    @everyone_else = Pick.where.not({ :user_id => id})
    @everyone_correct_picks = @everyone_else.where({ :final_result => "Correct"})
    @everyone_incorrect_picks = @everyone_else.where({ :final_result => "Not Correct"})


    @picks = Pick.all

    render("picks/index.html.erb")
  end

  def show
    @pick = Pick.find(params[:id])

    render("picks/show.html.erb")
  end

  def new
    @pick = Pick.new

    render("picks/new.html.erb")
  end

  def create
    @pick = Pick.new

    @pick.user_id = params[:user_id]
    @pick.game_id = params[:game_id]
    @pick.pick_id = params[:pick_id]
    @pick.final_result = params[:final_result]

    save_status = @pick.save

    if save_status == true
      redirect_to("/picks/", :notice => "Pick created successfully.")
    else
      render("picks/new.html.erb")
    end
  end

  def edit
    @pick = Pick.find(params[:id])

    render("picks/edit.html.erb")
  end

  def update
    @pick = Pick.find(params[:id])

    @pick.user_id = params[:user_id]
    @pick.game_id = params[:game_id]
    @pick.pick_id = params[:pick_id]
    @pick.final_result = params[:final_result]

    save_status = @pick.save

    if save_status == true
      redirect_to("/picks/", :notice => "Pick updated successfully.")
    else
      render("picks/edit.html.erb")
    end
  end

  def destroy
    @pick = Pick.find(params[:id])

    @pick.destroy

    if URI(request.referer).path == "/picks/#{@pick.id}"
      redirect_to("/", :notice => "Pick deleted.")
    else
      redirect_to(:back, :notice => "Pick deleted.")
    end
  end

  def update_results
    @picks = Pick.all
    @picks.each do |pick|


      if pick.game.final_underdog_score == nil
        pick.final_result = "Not yet available"
      else

        diff = pick.game.final_favorite_score.to_f-pick.game.final_underdog_score.to_f

        if diff > pick.game.spread
          cover="Yes"
        else cover="No"

        end

        if pick.pick_id == pick.game.favorite_id && cover =="Yes"
          pick.final_result = "Correct"

        else

          if pick.pick_id == pick.game.underdog_id && cover =="Yes"
            pick.final_result = "Not Correct"

          else

            if pick.pick_id == pick.game.underdog_id && cover =="No"
              pick.final_result = "Correct"

            else

              if pick.pick_id == pick.game.favorite_id && cover =="No"
                pick.final_result = "Not Correct"



              end
            end
          end
        end




      end
      pick.save
    end
    redirect_to("/picks/", :notice => "Pick results updated.")

  end




end
