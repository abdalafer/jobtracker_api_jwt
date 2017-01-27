class CustomersController < ApplicationController
  before_filter :authenticate!
  before_action :set_customer, only: [:show, :jobs, :update, :destroy]

  # GET /customers
  def index
    customers = current_user.customers
    render json: customers
  end

  def jobs
    render json: {customer: @customer, jobs: @customer.jobs}
  end

  # GET /customers/1
  def show
    render json: @customer
  end

  # POST /customers
  def create
    @customer = current_user.customers.new(customer_params)

    if @customer.save
      render json: @customer, status: :created, location: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customers/1
  def update
    if @customer.update(customer_params)
      render json: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /customers/1
  def destroy
    @customer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find_by_uuid(params[:uuid])
    end

    # Only allow a trusted parameter "white list" through.
    def customer_params
      params.require(:customer).permit(:full_name, :address, :notes)
    end
end
