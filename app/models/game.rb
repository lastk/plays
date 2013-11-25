class Game < ActiveRecord::Base
  SITE_URL = "http://plays.rodrigofranco.com/"

  validates :title, :url, :forum_url, :remote_cover, :presence => true

  def total_days_taken
    if self.finished_on && self.started_on
      (self.finished_on.to_date - self.started_on.to_date).to_i + 1
    else
     return 1
    end
  end

  def total_days_in_this_session
    self.total_days_played  + ((Date.today - self.started_on.to_date).to_i + 1)
  end
end
