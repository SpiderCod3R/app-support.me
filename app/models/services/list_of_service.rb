class Services::ListOfService
  include Mongoid::Document
  include Mongoid::Timestamps
  field :serviceOrderID, type: Integer
  field :serviceID, type: Integer

  belongs_to :service_order, class_name: "Services::ServiceOrder", foreign_key: "serviceOrderID"
  belongs_to :service, class_name: "Services::Service", foreign_key: "serviceID"
end
