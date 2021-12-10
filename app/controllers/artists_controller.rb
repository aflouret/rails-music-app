class ArtistsController < ApplicationController
    require "discogs"

    before_action do
        @discogs = Discogs::Wrapper.new("music-app", user_token: "SrWKXKdZFMqToajiBxyusQaZroBGcbNNiHIljyLk")
    end


    def show
        id = params[:id]
        @artist = @discogs.get_artist(id)
        @releases = @discogs.get_artist_releases(id).releases.select { |release| release.type == 'master'}
    end
end