class Client::CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :nr_doc, :fantasy_name, :requesters


  def requesters
    object.requesters.map do |requester|
      ::Client::RequesterSerializer.new(requester).attributes
    end
  end
end
