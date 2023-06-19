class Services::ServiceOrder
  include Mongoid::Document
  include Mongoid::Timestamps
  field :IDService, type: String
  field :IDClient, type: String
  field :IDRequester, type: String
  field :started_at, type: Time
  field :finished_at, type: Time
  field :value, type: Float

  embeds_many :services
  
  belongs_to :requester, class_name: "Client::Requester", foreign_key: "IDRequester"
  belongs_to :company, class_name: "Client::Company", foreign_key: "IDClient"
end
