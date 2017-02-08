class ReviewsController < ApplicationController
  def show
    @review = Review.find(params[:id])
  end

  def edit

  end

  def new
    @work = Work.find(params[:work_id])
    @review = @work.reviews.new
  end

  def create
    @work = Work.find(params[:work_id])
    @review = @work.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review Saved!"
      redirect_to work_path(@review.work)
    else
      flash[:notice] = "Review not Saved!"
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:name, :details, :rating )
  end
end
