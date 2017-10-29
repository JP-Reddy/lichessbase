class CreateGametypes < ActiveRecord::Migration[5.1]
  def change
    create_table :gametypes do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :gametypes, :name, unique: true

  end
end
