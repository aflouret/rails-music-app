class ReleasesController < ApplicationController
    require "discogs"

    before_action do
        @discogs = Discogs::Wrapper.new("music-app", user_token: "SrWKXKdZFMqToajiBxyusQaZroBGcbNNiHIljyLk")
    end

    def index               
        releases = Release.all

        @releases = releases.sort_by{|release| release.average_rating}.reverse!
    end
    
    def show
        id = params[:id]
        @release_data = @discogs.get_master(id)

        title = @release_data.title
        artist = @release_data.artists[0].name
        year = @release_data.year
        @release = Release.find_or_create_by(id: id, title: title, artist: artist, year: year)
        @review = @release.reviews.build
    end
end