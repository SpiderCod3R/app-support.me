class Client::CompaniesController < ApplicationController
  before_action :set_client_company, only: %i[ show update destroy ]

  # GET /client/companies
  def index
    @client_companies = Client::Company.all

    render json: @client_companies
  end

  # GET /client/companies/1
  def show
    render json: @client_company
  end

  # POST /client/companies
  def create
    @client_company = Client::Company.new(client_company_params)

    if @client_company.save
      render json: @client_company, status: :created, location: @client_company
    else
      render json: @client_company.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /client/companies/1
  def update
    if @client_company.update(client_company_params)
      render json: @client_company
    else
      render json: @client_company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /client/companies/1
  def destroy
    @client_company.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_company
      @client_company = Client::Company.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_company_params
      params.require(:client_company).permit(:name, :nr_doc, :fantasy_name)
    end
end
