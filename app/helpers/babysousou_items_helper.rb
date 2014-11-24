module BabysousouItemsHelper
  def babysousou_item_image(babysousou_item)
    offset = rand(babysousou_item.items.count)
    item = babysousou_item.items[offset]
    unless item.nil?
      image_tag item.image_url, style: 'width: 150px'
    else
      image_tag 'http://placehold.it/150&text=No+Items'
    end
  end
end
