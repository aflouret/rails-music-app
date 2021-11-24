class SearchController < ApplicationController
    require "discogs"

    before_action do
        @discogs = Discogs::Wrapper.new("music-app", user_token: "SrWKXKdZFMqToajiBxyusQaZroBGcbNNiHIljyLk")
    end
    
    
    def index
        @results_artists = @discogs.search(params[:query_artist], type: "artist").results

        @results_releases = @discogs.search(params[:query_release], type: "master", format: "album").results
    end
end