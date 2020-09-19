class CreateEstablishments < ActiveRecord::Migration[6.0]
  def change
    create_table :establishments do |t|
      t.string :place_id
      t.string :alias
      t.string :name
      t.string :image_url
      t.boolean :is_closed
      t.string :phone
      t.string :categories
      t.string :location
      t.string :coordinates
      t.timestamps
    end
  end
end
