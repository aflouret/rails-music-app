class ReviewsController < ApplicationController
    before_action :authenticate_user!

    def create
        @release = Release.find(params[:release_id])
        @review = @release.reviews.create(review_params.merge(user_id: current_user.id))
        redirect_to release_path(@release)
    end

    private
        def review_params
            params.require(:review).permit(:rating, :title, :body)
        end
end