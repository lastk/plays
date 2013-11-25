module GamesHelper

  def title_for(game)
    if  session['user_logged'].present?
      target = game.state == "current" ? finish_game_path(game) : start_game_path(game)
      return link_to(game.title, target)
    else
      return link_to(game.title, game.url)
    end
  end

  def stats_for(game)
    total_days_played  = game.state == "current"  ? game.total_days_in_this_session : game.total_days_played
    total_sessions     = game.total_sessions == 0    ? "1" : game.total_sessions

    raw("<a href='#' class='stats' data-toggle='tooltip' title='days played / times started playing '>( #{total_days_played} / #{total_sessions} )</a>")
  end

  def fave(game)
    icon = game.favorite? ? 'icon-heart' : 'icon-heart-empty'
    if  session['user_logged'].present?
      raw("<a href='/games/#{game.id}/fav'><i class='#{icon}'></i></a>")
    else
      # raw("<i class='#{icon}'></i>") if icon == "icon-heart"
    end
  end


  def sharing_message
    if @started.present?
      if @started.total_sessions.present? && @started.total_sessions > 0
        message =  "Rodrigo started playing #{@started.title}."
        message += " He started playing it #{@started.total_sessions} times before." if !@started.total_sessions.nil? && @started.total_sessions > 0
        message += " His interest on this game spanned #{@started.total_days_played} days until now." if !@started.total_days_played.nil? && @started.total_days_played > 0
      else
        message =  "Rodrigo started playing #{@started.title} for the first time."
      end
      return message
    else
      return false
    end
  end
end
