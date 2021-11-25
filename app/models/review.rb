class Review < ApplicationRecord
    belongs_to :release
    belongs_to :user

    validates :rating, presence: true, numericality: { in: 0..10 }
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
end
