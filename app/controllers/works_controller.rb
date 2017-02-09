class WorksController < ApplicationController

  def index
    @works = Work.all
    render :index
  end

  def show
    @work = Work.find(params[:id])
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    @work.avgrating=1.00
    if @work.save
      flash[:notice] = "Work succesfully added!"
      redirect_to works_path
    else
      flash[:notice] = "Work succesfully NOT added!"
      render :new
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    if @work.update(work_params)
      flash[:notice] = "Work successfully updated!"
      redirect_to works_path
    else
      flash[:notice] = "Work succesfully NOT updated!"
      render :edit
    end
  end

  def destroy
    @work = Work.find(params[:id])
    @work.destroy
    flash[:notice] = "Work deleted!"
    redirect_to works_path
  end

  def sort
    @works = Work.all.order("name")
    render :index
  end
#test
  private
    def work_params
      params.require(:work).permit(:name, :description, :artist, :author, :subgenre, :image )
    end
end
