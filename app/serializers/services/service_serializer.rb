class Services::ServiceSerializer < ActiveModel::Serializer
  attributes :_id, :name, :value
end
