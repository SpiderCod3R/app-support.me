class V1::Client::RequestersController < ApplicationController
  before_action :set_client_requester, only: %i[ show update destroy ]

  # GET /client/requesters
  def index
    @client_requesters = Client::Requester.all

    render json: @client_requesters
  end

  # GET /client/requesters/1
  def show
    render json: @client_requester
  end

  # POST /client/requesters
  def create
    @client_requester = Client::Requester.new(client_requester_params)

    if @client_requester.save
      render json: @client_requester, status: :created, location: @client_requester
    else
      render json: @client_requester.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /client/requesters/1
  def update
    if @client_requester.update(client_requester_params)
      render json: @client_requester
    else
      render json: @client_requester.errors, status: :unprocessable_entity
    end
  end

  # DELETE /client/requesters/1
  def destroy
    @client_requester.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_requester
      @client_requester = Client::Requester.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_requester_params
      params.require(:client_requester).permit(:first_name, :last_name, :phone_number, :IDCompany)
    end
end
