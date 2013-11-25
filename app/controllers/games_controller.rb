class GamesController < ApplicationController
  before_filter :authenticate, :define_current_user, :except => [:index]
  before_filter :resource, :except => [:index, :new, :create]

  def index

    if session['started_game'].present?
      @started  = Game.find(session['started_game'])
      session['started_game'] = nil
    end

    @current  = Game.where(:state => "current").order("title asc")
    @finished = Game.where(:state => "finished").order("title asc")
  end

  def show
  end

  def new
    @game = Game.new
  end

  def edit
  end

  def create
    @game                = Game.new(game_params)
    @game.started_on     = Date.today
    @game.total_sessions = @game.total_sessions + 1
    if @game.save
      session['started_game'] = @game.id
      redirect_to "/"
    else
      render action: "new"
    end
  end

  def update
    if @game.update_attributes(game_params)
      format.html { redirect_to @game, notice: 'Game was successfully updated.' }
    else
      format.html { render action: "edit" }
    end
  end

  def destroy
    @game.destroy
    redirect_to games_url
  end

  def finish
    @game.finished_on       = Date.today
    @game.total_days_played = @game.total_days_played + @game.total_days_taken
    @game.state             = "finished"
    @game.save
    redirect_to games_path
  end

  def start
    @game.started_on        = Date.today
    @game.state             = "current"
    @game.total_sessions    = @game.total_sessions + 1
    @game.save
    session['started_game'] = @game.id
    redirect_to "/"
  end

  def fav
    shift = game.favorite? ? true : false
    game.update_attribute(:favorite, shift)
    redirect_to "/"
  end

  private

  def game_params
    params.require(:game).permit(:blurb, :finished_on, :platform_id, :rate, :remote_cover, :review, :started_on, :state, :title, :total_sessions, :url, :forum_url)
  end

  def resource
    @game = Game.find(params[:id])
  end
end
