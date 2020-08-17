class JobsController < ApplicationController
  def index
    jobs = Job.all

    render json: JobSerializer.new(jobs).serialized_json
  end

  def create
    job = Job.new(job_params)

    if job.save
      render json: JobSerializer.new(job).serialized_json
    else
      render json: { error: job.errors.messages }, status: 422
    end
  end

  def update
    job = job.find_by(slug: params[:id])

    if job.update(job_params)
      render json: JobSerializer.new(job).serialized_json
    else
      render json: { error: job.errors.messages }, status: 422
    end
  end

  def destroy
    job = job.find_by(slug: params[:id])

    if job.update(job_params)
      head :no_content
    else
      render json: { error: job.errors.messages }, status: 422
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
