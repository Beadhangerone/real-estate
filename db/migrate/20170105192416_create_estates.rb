class CreateEstates < ActiveRecord::Migration[5.0]
  def change
    create_table :estates do |t|
      t.text :title
      t.text :state
      t.text :region
      t.integer :bedrooms
      t.text :offer
      t.integer :price
      t.timestamps
    end
  end
end
