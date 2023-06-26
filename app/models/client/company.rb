class Client::Company
  include Mongoid::Document
  include Mongoid::Timestamps
  REQUESTER_COUNT_MIN=1
  attr_accessor :requesters_attributes

  field :name, type: String
  field :fantasy_name, type: String
  field :nr_doc, type: String

  has_many :requesters, class_name: "Client::Requester", foreign_key: "IDCompany"

  validate :cnpj_formatado_corretamente

  accepts_nested_attributes_for :requesters, allow_destroy: true, reject_if: ->(attributes){ attributes['first_name'].blank? }
  
  validate :check_if_client_has_at_least_one_requester, on: :create

  def requester_presence_is_valid?
    return true if self.requesters.present?
  end

  def check_if_client_has_at_least_one_requester
    unless requester_presence_is_valid?
      errors.add(:base, 'Cliente deve ser cadastrado com ao menos um solicitante')
    end
  end

  def as_json(options={})
    super(
      root: false,
      except: [:created_at, :updated_at]
    )
  end

  private
    def cnpj_formatado_corretamente
      unless CNPJ.valid?(self.nr_doc)
        self.errors.add(:nr_doc, "CNPJ is invalid. Please correct and try again.")
      end
    end
end
