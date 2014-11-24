class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :source
      t.string :external_id
      t.string :title
      t.string :price_type
      t.hstore :prices
      t.string :price_currency
      t.string :item_url
      t.string :image_url
      t.text :description
      t.hstore :additional_info

      t.timestamps
    end
  end
end
