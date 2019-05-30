class Animal < ApplicationRecord
  belongs_to :curator

  validates :name, :kind, :curator, :monthly_cost, presence: true
  validate :is_curator_18_years_old?, if: -> { kind == "Andorinha" }
  validate :curator_name_starts_with_a?, if: -> { kind == "Gato" }
  validate :curator_monthly_costs_higher_than_1000?, on: :create

  before_save :camelcase_names

  private
  def camelcase_names
    self.name = name.camelcase
    self.kind = kind.camelcase
  end

  def is_curator_18_years_old?
    errors.add(:curator, 'Idade inválida para esta espécie') if Date.current.year - curator.birthday.year > 18
  end

  def curator_name_starts_with_a?
    errors.add(:curator, 'Nome inválido para esta espécie') if curator.name[0] == "A"
  end

  def curator_monthly_costs_higher_than_1000?
    errors.add(:curator, 'Custo mensal já está superior a R$ 1000') if curator.animals.pluck(:monthly_cost).reduce(:+) > 1000
  end
end
