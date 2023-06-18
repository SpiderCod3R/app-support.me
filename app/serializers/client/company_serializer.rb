class Client::CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :nr_doc, :fantasy_name
end
