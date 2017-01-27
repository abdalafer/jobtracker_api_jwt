class JobTasksController < ApplicationController
  before_action :set_job_task, only: [:show, :update, :destroy]

  # GET /job_tasks
  def index
    job = Job.where(uuid: params[:uuid]).first
    render json: job
  end

  # GET /job_tasks/1
  def show
    render json: @job_task
  end

  # POST /job_tasks
  def create
    job = Job.where(uuid: params[:job_task][:job_uuid]).first

    @job_task = job.job_tasks.new(job_task_params)

    if @job_task.save
      render json: @job_task, status: :created, location: @job_task
    else
      render json: @job_task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /job_tasks/1
  def update
    if @job_task.update(job_task_params)
      render json: @job_task
    else
      render json: @job_task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /job_tasks/1
  def destroy
    @job_task.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_task
      @job_task = JobTask.find_by_uuid(params[:uuid])
    end

    # Only allow a trusted parameter "white list" through.
    def job_task_params
      params.require(:job_task).permit(:title, :state, :notes)
    end
end
