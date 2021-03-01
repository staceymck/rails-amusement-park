class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    user = User.find_by_id(user_id)
    attraction = Attraction.find_by_id(attraction_id)
    errors = "Sorry."
    if user.height < attraction.min_height || user.tickets < attraction.tickets
      errors += " You do not have enough tickets to ride the #{attraction.name}." if user.tickets < attraction.tickets
      errors += " You are not tall enough to ride the #{attraction.name}." if user.height < attraction.min_height
      errors
    else
      user.happiness += attraction.happiness_rating
      user.nausea += attraction.nausea_rating
      user.tickets -= attraction.tickets
      user.save
      "Thanks for riding the #{attraction.name}!"
    end
  end


end
