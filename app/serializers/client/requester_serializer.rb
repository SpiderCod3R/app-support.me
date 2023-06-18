class Client::RequesterSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :phone_number, :IDCompany
end
