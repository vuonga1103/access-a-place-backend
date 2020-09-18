class CreateEstablishments < ActiveRecord::Migration[6.0]
  def change
    create_table :establishments do |t|
      t.string :place_id
      t.string :name

      t.timestamps
    end
  end
end
