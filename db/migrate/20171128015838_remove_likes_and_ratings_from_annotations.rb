class RemoveLikesAndRatingsFromAnnotations < ActiveRecord::Migration[5.1]
  def change
    remove_column :annotations, :likes, :integer
    remove_column :annotations, :rating, :integer
  end
end
