class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :title
      t.integer :price
      t.text :description
      t.text :address

      t.belongs_to :user
      t.timestamps
    end
  end
end
