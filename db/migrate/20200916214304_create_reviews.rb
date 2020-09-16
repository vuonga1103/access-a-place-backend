class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :establishment_id
      t.integer :entrance_rating
      t.integer :bathroom_rating
      t.integer :parking_rating
      t.integer :interior_rating
      t.text :content

      t.timestamps
    end
  end
end
