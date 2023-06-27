class V1::Services::ServiceOrdersController < ApiController
  before_action :set_v1_services_service_order, only: %i[ show update destroy ]

  # GET /v1/services/service_orders
  def index
    @service_orders = Services::ServiceOrder.all

    render json: @service_orders
  end

  # GET /v1/services/service_orders/1
  def show
    render json: @service_order
  end

  # POST /v1/services/service_orders
  def create
    @service_order = Services::ServiceOrder.new(service_order_params)
    serviceList = params[:services_ids].present? ? params[:services_ids] : []
    @service_order.add_services(serviceList) unless serviceList.empty?

    if @service_order.save
      render json: @service_order, status: :created, location: v1_services_service_order_path(@service_order)
    else
      render json: ErrorSerializer.serialize(@services_service.errors), status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/services/service_orders/1
  def update
    if @service_order.update(service_order_params)
      render json: @service_order
    else
      render json: @service_order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /v1/services/service_orders/1
  def destroy
    @service_order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_v1_services_service_order
      @service_order = Services::ServiceOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_order_params
      params.require(:service_order).permit(:IDService, :IDClient, :IDRequester, 
        :started_at, :finished_at, :value)
    end
end
