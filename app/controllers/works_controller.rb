class WorksController < ApplicationController

  def index
    @works = Work.all
  end

  def show
    @work = Work.find(params[:id])
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      flash[:notice] = "Work succesfully added!"
      redirect_to works_path
    else
      flash[:notice] = "Work succesfully NOT added!"
      render :new
    end
  end
  #
  # def edit
  #   @work = Work.find(params[:id])
  # end
  #
  # def update
  #   @work = work.find(params[:id])
  #   if @work.update(work_params)
  #     flash[:notice] = "Work successfully updated!"
  #     redirect_to works_path
  #   else
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   @work = Work.find(params[:id])
  #   @work.destroy
  #   flash[:notice] = "Work deleted!"
  #   redirect_to works_path
  # end

  private
    def work_params
      params.require(:work).permit(:name, :description, :artist, :author, :subgenre, :image )
    end
end
