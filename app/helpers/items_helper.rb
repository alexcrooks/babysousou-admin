module ItemsHelper
  def item_source(item)
    case item.source
      when 'diapers'
        image_tag 'diapers.png', style: 'width: 50px;'
      when 'target'
        image_tag 'target.png', style: 'width: 50px;'
    end
  end

  def item_title(item, details)
    unless details.nil?
      (details[:highlight][:title] || item.title).html_safe
    else
      item.title
    end
  end

  def item_description(item, details)
    unless details.nil?
      (details[:highlight][:description] || item.description).html_safe
    else
      item.description
    end
  end

  def item_price(item)
    if item.price_type.eql?('static')
      "#{item.price} #{item.price_currency}"
    elsif item.price_type.eql?('range')
      "#{item.low_price} - #{item.high_price} #{item.price_currency}"
    end
  end
end
