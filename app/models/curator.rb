class Curator < ApplicationRecord
  has_many :animals

  validates :name, :document, :birthday, presence: true
  before_save :camelcase_name

  private
  def camelcase_name
    self.name = name.camelcase
  end
end
