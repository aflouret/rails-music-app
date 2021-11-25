class ReviewsController < ApplicationController
    def create
        @release = Release.find(params[:release_id])
        @review = @release.reviews.create(review_params.merge(user_id: 1))
        redirect_to release_path(@release)
    end

    private
        def review_params
            params.require(:review).permit(:rating, :title, :body)
        end
end