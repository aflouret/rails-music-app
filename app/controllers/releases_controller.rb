class ReleasesController < ApplicationController
    require "discogs"

    before_action do
        @discogs = Discogs::Wrapper.new("music-app", user_token: "SrWKXKdZFMqToajiBxyusQaZroBGcbNNiHIljyLk")
    end

    def show
        id = params[:id]
        @release = @discogs.get_release(id)
    end
end