require "test_helper"

class Client::RequestersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client_requester = client_requesters(:one)
  end

  test "should get index" do
    get client_requesters_url, as: :json
    assert_response :success
  end

  test "should create client_requester" do
    assert_difference("Client::Requester.count") do
      post client_requesters_url, params: { client_requester: { IDCompany: @client_requester.IDCompany, first_name: @client_requester.first_name, last_name: @client_requester.last_name, phone_number: @client_requester.phone_number } }, as: :json
    end

    assert_response :created
  end

  test "should show client_requester" do
    get client_requester_url(@client_requester), as: :json
    assert_response :success
  end

  test "should update client_requester" do
    patch client_requester_url(@client_requester), params: { client_requester: { IDCompany: @client_requester.IDCompany, first_name: @client_requester.first_name, last_name: @client_requester.last_name, phone_number: @client_requester.phone_number } }, as: :json
    assert_response :success
  end

  test "should destroy client_requester" do
    assert_difference("Client::Requester.count", -1) do
      delete client_requester_url(@client_requester), as: :json
    end

    assert_response :no_content
  end
end
