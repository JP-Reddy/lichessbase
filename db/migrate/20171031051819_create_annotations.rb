class CreateAnnotations < ActiveRecord::Migration[5.1]
  def change
    create_table :annotations do |t|
      t.text :annotation
      t.integer :likes
      t.integer :rating

      t.timestamps
    end
  end
end
