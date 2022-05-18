class Match < ActiveRecord::Base
  has_many :forecasts
  belongs_to :match_day
  belongs_to :home, class_name: "Team"
  belongs_to :away, class_name: "Team"

  before_update :calculate_points,  if: :result_or_goals_changed?

  def has_result?
    self.result != nil and self.goals_home != nil and self.goals_away != nil
  end

  def set_result(result, goals_home, goals_away)
    self.result = result 
    self.goals_home = goals_home
    self.goals_away = goals_away
  end

  def calculate_points 
    self.forecasts.each do |forecast|
      forecast_points = forecast.calculate_points 
      
      point = Point.find_by(player_id: forecast.player_id, tournament_id: forecast.tournament_id)
      
      point.total_points += forecast_points - forecast.old_points
      
      point.save
    end
  end

  def result_or_goals_changed? 
    self.result_changed? || self.goals_home_changed? || self.goals_away_changed? 
  end
  

end