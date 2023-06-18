require "test_helper"

class Client::CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client_company = client_companies(:one)
  end

  test "should get index" do
    get client_companies_url, as: :json
    assert_response :success
  end

  test "should create client_company" do
    assert_difference("Client::Company.count") do
      post client_companies_url, params: { client_company: { fantasy_name: @client_company.fantasy_name, name: @client_company.name, nr_doc: @client_company.nr_doc } }, as: :json
    end

    assert_response :created
  end

  test "should show client_company" do
    get client_company_url(@client_company), as: :json
    assert_response :success
  end

  test "should update client_company" do
    patch client_company_url(@client_company), params: { client_company: { fantasy_name: @client_company.fantasy_name, name: @client_company.name, nr_doc: @client_company.nr_doc } }, as: :json
    assert_response :success
  end

  test "should destroy client_company" do
    assert_difference("Client::Company.count", -1) do
      delete client_company_url(@client_company), as: :json
    end

    assert_response :no_content
  end
end
