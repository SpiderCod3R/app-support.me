require "test_helper"

class Services::ServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @services_service = services_services(:one)
  end

  test "should get index" do
    get services_services_url, as: :json
    assert_response :success
  end

  test "should create services_service" do
    assert_difference("Services::Service.count") do
      post services_services_url, params: { services_service: { name: @services_service.name, value: @services_service.value } }, as: :json
    end

    assert_response :created
  end

  test "should show services_service" do
    get services_service_url(@services_service), as: :json
    assert_response :success
  end

  test "should update services_service" do
    patch services_service_url(@services_service), params: { services_service: { name: @services_service.name, value: @services_service.value } }, as: :json
    assert_response :success
  end

  test "should destroy services_service" do
    assert_difference("Services::Service.count", -1) do
      delete services_service_url(@services_service), as: :json
    end

    assert_response :no_content
  end
end
