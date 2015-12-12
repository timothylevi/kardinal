class RatingCalculator < ActiveRecord::Base

  def calc(user, event)
    coeff = self.__send__(event.to_s)
    user.rating + coeff
  end

end
