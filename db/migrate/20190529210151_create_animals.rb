class CreateAnimals < ActiveRecord::Migration[5.1]
  def change
    create_table :animals do |t|
      t.string :name
      t.float :monthly_cost
      t.string :kind
      t.integer :curator_id

      t.timestamps
    end
  end
end
