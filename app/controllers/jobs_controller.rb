class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
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
      %i[name]
    )
  end
end
