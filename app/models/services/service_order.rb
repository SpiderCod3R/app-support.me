class Services::ServiceOrder
  include Mongoid::Document
  include Mongoid::Timestamps
  field :IDService, type: Integer
  field :IDClient, type: Integer
  field :IDRequester, type: Integer
  field :started_at, type: Time
  field :finished_at, type: Time
  field :value, type: Float

  has_and_belongs_to_many :services, join_table: "Services::TypeOfService", foreign_key: "IDService"
  has_one :requester, class_name: "Client::Requester", foreign_key: "IDRequester"
  has_one :company, class_name: "Client::Company", foreign_key: "IDClient"
end
