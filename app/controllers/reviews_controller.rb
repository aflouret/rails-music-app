class ReviewsController < ApplicationController
    before_action :authenticate_user!

    def create
        @release = Release.find(params[:release_id])
        @review = @release.reviews.create(review_params.merge(user_id: current_user.id))
        redirect_to release_path(@release)
    end

    def destroy
        @release = Release.find(params[:release_id])
        @review = @release.reviews.find(params[:id])
        if @review.user_id == current_user.id
            @review.destroy
            redirect_to release_path(@release)
        end
    end

    def edit
        @release = Release.find(params[:release_id])
        @review = Review.find(params[:id])
        if current_user.id == @review.user_id
            render :edit
        else
            redirect_to @release
        end
    end

    def update
        @release = Release.find(params[:release_id])
        @review = Review.find(params[:id])

        if @review.update(review_params)
            redirect_to @release
        else 
            render :edit
        end
    end

    private
        def review_params
            params.require(:review).permit(:rating, :title, :body)
        end
end