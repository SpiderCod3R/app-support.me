class Services::ServiceOrderSerializer < ActiveModel::Serializer
  attributes :id, :started_at, :finished_at, :total_value, 
             :company, :requester, :requested_services

  def requested_services
    object.services.map do |service|
      ::Services::ServiceSerializer.new(service).attributes
    end
  end
end
