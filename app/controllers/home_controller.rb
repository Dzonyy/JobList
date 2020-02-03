class HomeController < ApplicationController
  before_action :load_jobs

  def index
  end

  def load_jobs
    @layout_jobs = Job.all
  end
end
