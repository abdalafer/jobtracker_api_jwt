class JobsController < ApplicationController
  before_action :set_job, only: [:show, :job_tasks, :update, :destroy]

  # GET /jobs
  def index
    customer = current_user.customers.where(uuid: params[:customer_uuid]).first
    render json: customer
  end

  def job_tasks
    render json: {job: @job, job_tasks: @job.job_tasks.group_by {|t|t.state} }
  end

  # GET /jobs/1
  def show
    render json: @job
  end

  # POST /jobs
  def create
    customer = current_user.customers.where(uuid: params[:job][:customer_uuid]).first
    @job = customer.jobs.new(job_params)

    if @job.save
      render json: @job, status: :created, location: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /jobs/1
  def update
    if @job.update(job_params)
      render json: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  # DELETE /jobs/1
  def destroy
    @job.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find_by_uuid(params[:uuid])
    end

    # Only allow a trusted parameter "white list" through.
    def job_params
      params.require(:job).permit(:title, :state, :notes)
    end
end
