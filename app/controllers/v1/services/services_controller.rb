class V1::Services::ServicesController < ApplicationController
  before_action :set_services_service, only: %i[ show update destroy ]

  # GET /services/services
  def index
    @services_services = Services::Service.all

    render json: @services_services
  end

  # GET /services/services/1
  def show
    render json: @services_service
  end

  # POST /services/services
  def create
    @services_service = Services::Service.new(services_service_params)

    if @services_service.save
      render json: @services_service, status: :created
    else
      render json: ErrorSerializer.serialize(@services_service.errors), status: :unprocessable_entity
    end
  end

  # PATCH/PUT /services/services/1
  def update
    if @services_service.update(services_service_params)
      render json: @services_service
    else
      render json: ErrorSerializer.serialize(@services_service.errors), status: :unprocessable_entity
    end
  end

  # DELETE /services/services/1
  def destroy
    if @services_service.destroy
      render json: {status: :no_content, message: "Service Successfully deleted"}
    else
      render json: ErrorSerializer.serialize(@services_service.errors), status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_services_service
      begin
        @services_service = Services::Service.find(params[:id])
      rescue Mongoid::Errors::DocumentNotFound => e
        render json: { message: "Service Not Found", full_message: e.message.gsub("\nmessage:\n", ''),  status: 404}
      end
    end

    # Only allow a list of trusted parameters through.
    def services_service_params
      params.require(:service).permit(:name, :value)
    end
end
