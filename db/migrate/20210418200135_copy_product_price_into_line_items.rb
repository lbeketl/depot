class CopyProductPriceIntoLineItems < ActiveRecord::Migration[6.1]
  def up
    LineItem.all.each do |line_item|
      product = Product.find(line_item.product_id)
      line_item.price = product.price
      line_item.save!
    end
  end

  def down
    LineItem.all.each do |line_item|
      line_item.price = nil
      line_item.save!
    end
  end
end
