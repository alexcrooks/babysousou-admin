class AddBabysousouItemToItems < ActiveRecord::Migration
  def change
    add_reference :items, :babysousou_item, index: true
  end
end
