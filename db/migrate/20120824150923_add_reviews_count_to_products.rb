class AddReviewsCountToProducts < ActiveRecord::Migration
  def change
    add_column :products, :reviews_count, :integer
  end
end
