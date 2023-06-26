require "test_helper"

class V1::Services::ServiceOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @v1_services_service_order = v1_services_service_orders(:one)
  end

  test "should get index" do
    get v1_services_service_orders_url, as: :json
    assert_response :success
  end

  test "should create v1_services_service_order" do
    assert_difference("V1::Services::ServiceOrder.count") do
      post v1_services_service_orders_url, params: { v1_services_service_order: { IDClient: @v1_services_service_order.IDClient, IDRequester: @v1_services_service_order.IDRequester, IDService: @v1_services_service_order.IDService, finished_at: @v1_services_service_order.finished_at, started_at: @v1_services_service_order.started_at, value: @v1_services_service_order.value } }, as: :json
    end

    assert_response :created
  end

  test "should show v1_services_service_order" do
    get v1_services_service_order_url(@v1_services_service_order), as: :json
    assert_response :success
  end

  test "should update v1_services_service_order" do
    patch v1_services_service_order_url(@v1_services_service_order), params: { v1_services_service_order: { IDClient: @v1_services_service_order.IDClient, IDRequester: @v1_services_service_order.IDRequester, IDService: @v1_services_service_order.IDService, finished_at: @v1_services_service_order.finished_at, started_at: @v1_services_service_order.started_at, value: @v1_services_service_order.value } }, as: :json
    assert_response :success
  end

  test "should destroy v1_services_service_order" do
    assert_difference("V1::Services::ServiceOrder.count", -1) do
      delete v1_services_service_order_url(@v1_services_service_order), as: :json
    end

    assert_response :no_content
  end
end
