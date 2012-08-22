class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :summary
      t.text :description
      t.1..5 :rating

      t.timestamps
    end
  end
end
