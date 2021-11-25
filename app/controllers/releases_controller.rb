class ReleasesController < ApplicationController
    require "discogs"

    before_action do
        @discogs = Discogs::Wrapper.new("music-app", user_token: "SrWKXKdZFMqToajiBxyusQaZroBGcbNNiHIljyLk")
    end

    def index
        @releases = Release.all
    end
    def show
        id = params[:id]
        @release = @discogs.get_master(id)

        title = @release.title
        artist = @release.artists[0].name
        year = @release.year
        @release_object = Release.find_or_create_by(id: id, title: title, artist: artist, year: year)
    end
end