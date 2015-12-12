class RatingCalculator < ActiveRecord::Base

  def calc(user, event)
    coeff = self.__send__(event)
    user.rating + coeff
  end

end
