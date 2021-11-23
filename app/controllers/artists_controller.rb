class ArtistsController < ApplicationController
    require "discogs"

    before_action do
        @discogs = Discogs::Wrapper.new("hehe", user_token: "SrWKXKdZFMqToajiBxyusQaZroBGcbNNiHIljyLk")
    end


    # def index
    #     @artists = @discogs.get_artist_releases("260935", :per_page => 200, :type => "release")

    # end

    def show
        id = params[:id]
        @artist = @discogs.get_artist(id)
        @releases = @discogs.get_artist_releases(id)
    end
end