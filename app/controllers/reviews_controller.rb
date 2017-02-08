class ReviewsController < ApplicationController

  def new
    @work = Work.find(params[:work_id])
    @review = @work.reviews.new
  end

  def create
    @work = Work.find(params[:work_id])
    @review = @work.reviews.new(review_params)
    if @review.save
      @work.avgrating = (((@work.avgrating * (@work.reviews.length - 1))+ @review.rating) / @work.reviews.length)
      @work.save
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
    @work.avgrating = (((@work.avgrating * @work.reviews.length)- @review.rating) / (@work.reviews.length - 1))
    if @work.avgrating.nan?
      @work.avgrating = 1
      @work.save
    else
      @work.save
    end
    if @review.update(review_params)
      @work.avgrating = (((@work.avgrating * (@work.reviews.length - 1))+ @review.rating) / @work.reviews.length)
      @work.save
      flash[:notice] = "Review Updated"
      redirect_to work_path(@review.work)
    else
      render :edit
    end
  end

  def destroy
    @work = Work.find(params[:work_id])
    @review = Review.find(params[:id])
    @work.avgrating = (((@work.avgrating * @work.reviews.length)- @review.rating) / (@work.reviews.length - 1))
    if @work.avgrating.nan?
      @work.avgrating = 1
      @work.save
    else
      @work.save
    end
    @review.destroy
    flash[:notice] = "Review Deleted!"
      redirect_to work_path(@review.work)# still getting work_review data but redirecting to work
  end

  private
  def review_params
    params.require(:review).permit(:name, :details, :rating )
  end
end
