class Client::Company
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :fantasy_name, type: String
  field :nr_doc, type: String

  validate :cnpj_formatado_corretamente

  has_many :requesters, class_name: "Client::Requester", foreign_key: "IDCompany"

  private
    def cnpj_formatado_corretamente
      unless CNPJ.valid?(self.nr_cnpj)
        self.errors.add(:nr_cnpj, "CNPJ is invalid. Please correct and try again.")
      end
    end
end
