class Client::Requester
  include Mongoid::Document
  include Mongoid::Timestamps
  field :first_name, type: String
  field :last_name, type: String
  field :phone_number, type: String
  field :IDCompany, type: Integer
  validates :first_name, :last_name, :phone_number, presence: true, uniqueness: true

  belongs_to :company, class_name: "Client::Company", foreign_key: "IDCompany"
end
