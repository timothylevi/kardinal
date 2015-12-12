module Helpers
  module Rating

    def self.update(user, event)
      calculator = ::RatingCalculator.first
      new_rating = calculator.calc(user, event)
      ::Rails.logger.info "Updating user #{user.email} rating to #{new_rating}. Event: #{event}"
      user.update_attribute(:rating, new_rating)
    end

  end
end
