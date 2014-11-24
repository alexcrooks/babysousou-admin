class Item < ActiveRecord::Base
  searchkick

  belongs_to :babysousou_item
  hstore_accessor :prices,
                  price: :string,
                  high_price: :float,
                  low_price: :float

  scope :not_imported, -> {where(babysousou_item: nil)}
end
Item.reindex