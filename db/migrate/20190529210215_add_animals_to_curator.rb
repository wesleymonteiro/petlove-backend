class AddAnimalsToCurator < ActiveRecord::Migration[5.1]
  def change
    add_reference :curators, :animals, foreign_key: true
  end
end
