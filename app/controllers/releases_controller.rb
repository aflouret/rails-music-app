class ReleasesController < ApplicationController
    require "discogs"

    before_action do
        @discogs = Discogs::Wrapper.new("hehe", user_token: "SrWKXKdZFMqToajiBxyusQaZroBGcbNNiHIljyLk")
    end

    def show
        id = params[:id]
        @release = @discogs.get_release(id)
    end
end