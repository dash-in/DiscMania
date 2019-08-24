class ReviewsController < ApplicationController
	def create
		record = Record.find(params[:record_id])
		review = current_user.reviews.new(review_params)
		review.record_id = record.id
		if review.save
		   flash[:success] = "コメントを投稿しました！"
           redirect_back(fallback_location: root_url)
        else
        	flash[:success] = "コメントの投稿に失敗しました！"
        	redirect_back(fallback_location: root_url)
        end
	end

	def destroy
		review = Review.find(params[:id])
	if  review.destroy
		flash[:success] = "コメントを削除しました！！！"
        redirect_back(fallback_location: root_url)
    else
    	flash[:success] = "コメントの削除に失敗しました！"
        redirect_back(fallback_location: root_url)
    end
	end

	def edit
		@review = Review.find(params[:id])
		@record = Record.find(params[:record_id])
	end

	def update
		review = Review.find(params[:id])
		review.update(review_params)
		redirect_to records_path(@record_id)

	end


	def review_params
		params.require(:review).permit(:record_id, :user_id, :review )
	end
end
