class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(params[:job_params])
    if @job.save
      redirect_to @job
    else
      render "new"
    end
  end

  def job_modal
    @job = Job.friendly.find(params[:slug])
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def job_params
    params.require(:job).permit(
      %i[name category_id pricing_id salary_from salary_to experience company_name company_city address slug] +
      [job_technologies: %i[name rating]]
    )
  end
end
