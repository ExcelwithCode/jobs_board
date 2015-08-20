class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end
  
  def show
    @job = Job.find(params[:id])
  end
  
  def edit
    @job = Job.find(params[:id])
    redirect_to @job if @job.paid?
  end
  
  def update
    @job = Job.find(params[:id])
    if !(@job.paid?)
      @job.update_attributes(stripeEmail: params[:stripeEmail],
                      payola_sale_guid: params[:payola_sale_guid])
      @job.update(job_params) unless @job.paid?
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
      redirect_to preview_job_path(@job)
    else
      render :new
    end
  end
  
  def preview
    @job = Job.find(params[:id])
    redirect_to @job if @job.paid?
  end
  
  def payment
    @job = Job.find_by_permalink(params[:permalink])
    redirect_to job_path(@job) if @job.paid?
  end
  
  private
  
  def job_params
    params.require(:job).permit(:title, :category, :location,
                                :description, :to_apply, :email,
                                :company_name, :website)
  end
end