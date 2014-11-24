class CreateBabysousouItems < ActiveRecord::Migration
  def change
    create_table :babysousou_items do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
