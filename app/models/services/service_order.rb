class Services::ServiceOrder
  include Mongoid::Document
  include Mongoid::Timestamps
  field :IDService, type: String
  field :IDClient, type: String
  field :IDRequester, type: String
  field :started_at, type: Time
  field :finished_at, type: Time
  field :total_value, type: Float

  embeds_many :services
  
  belongs_to :requester, class_name: "Client::Requester", foreign_key: "IDRequester"
  belongs_to :company, class_name: "Client::Company", foreign_key: "IDClient"

  after_create :set_total_value

  def add_services(service_list)
    service_list.each do |service|
      self.services << Services::Service.find(service)
    end
  end


  private
  def set_total_value
    begin
      if not self.services.empty?
        self.total_value = self.services.map(&:value).inject(0, :+)
      end
    rescue Exception => e
      
    end
  end
end
