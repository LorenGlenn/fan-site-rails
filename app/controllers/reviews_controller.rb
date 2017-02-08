class ReviewsController < ApplicationController

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

  def edit
    @work = Work.find(params[:work_id])
    @review = Review.find(params[:id])
    render :edit
  end

  def update
    @work = Work.find(params[:work_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Review Updated"
      redirect_to work_path(@review.work)
    else
      render :edit
    end
  end

  def destroy
    @work = Work.find(params[:work_id])
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Review Deleted!"
      redirect_to work_path(@review.work)# still getting work_review data but redirecting to work
  end

  private
  def review_params
    params.require(:review).permit(:name, :details, :rating )
  end
end
