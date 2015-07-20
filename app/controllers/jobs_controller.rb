class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end
  
  def show
    @job = Job.find(params[:id])
  end
  
  def edit
    @job = Job.find(params[:id])
  end
  
  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      flash[:notice] = "Your job ad has been updated. Please continue to Step 3."
      redirect_to preview_job_path(@job)
    else
      render :edit
    end
  end
  
  def new
    @job = Job.new
  end
  
  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:notice] = "Your job ad has been created. Please continue to Step 3."
      redirect_to preview_job_path(@job)
    else
      render :new
    end
  end
  
  def preview
    @job = Job.find(params[:id])
  end
  
  def payment
    @job = Job.find_by_permalink(params[:permalink])
  end
  
  private
  
  def job_params
    params.require(:job).permit(:title, :category, :location,
                                :description, :to_apply)
  end
end