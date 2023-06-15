class Services::Service
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :value, type: Float

  has_many :orders, class_name: "Services::ServiceOrder", foreign_key: "IDService"

  def as_json(options={})
    super(
      root: false,
      except: [:created_at, :updated_at]
    )
  end
end
