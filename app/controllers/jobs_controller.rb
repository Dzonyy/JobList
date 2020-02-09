class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def job_modal
    respond_to do |format|
      format.html
      format.js
    end
  end
end
