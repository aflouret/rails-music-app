class Release < ApplicationRecord
    has_many :reviews

    def average_rating
        if self.reviews.length == 0
            return 0
        end

        rating_sum = self.reviews.reduce(0) do |sum, review|
            sum + review.rating
        end

        (rating_sum.to_f / self.reviews.length.to_f).round(1)
    end
end
