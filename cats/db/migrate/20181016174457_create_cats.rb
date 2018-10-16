class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.date :birth_date, null: false
      t.string :color, null: false
      t.string :name, null: false
      t.text :description
      t.timestamps null: false
    end
    add_column(:cats, :sex, :string, { limit: 1, null: false })
  end
end
