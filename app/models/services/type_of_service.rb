class Services::TypeOfService
  include Mongoid::Document
  include Mongoid::Timestamps
  field :IDServiceOrder, type: Integer
  field :IDService, type: Integer

  belongs_to :service_order, class_name: "Services::ServiceOrder", foreign_key: "IDServiceOrder"
  belongs_to :service, class_name: "Services::Service", foreign_key: "IDService"
end
