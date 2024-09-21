class CreateSubmissions < ActiveRecord::Migration[7.2]
  def change
    create_table :submissions do |t|
      t.string :name
      t.float :height
      t.float :arm_length
      t.float :difference
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end
end
