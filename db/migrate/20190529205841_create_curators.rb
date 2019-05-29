class CreateCurators < ActiveRecord::Migration[5.1]
  def change
    create_table :curators do |t|
      t.string :name
      t.string :document
      t.date :birthday

      t.timestamps
    end
  end
end
