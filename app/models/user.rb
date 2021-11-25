class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_releases, :through => :reviews, :source => :release
end
