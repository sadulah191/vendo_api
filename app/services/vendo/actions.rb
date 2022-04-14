module Vendo::Actions
  def authenticate
    Vendo::Client.new.auth
  end

  def create_cart
    Vendo::Cart.new(self).create
  end

  def get_cart(include_line_items = false)
    Vendo::Cart.new(self).get(include_line_items)
  end

  def add_line_item(variant_id:, quantity:)
    Vendo::LineItem.new(self).add_item(variant_id: variant_id, quantity: quantity)
  end

  def remove_line_item(line_item_id:)
    Vendo::LineItem.new(self).remove_item(line_item_id: line_item_id)
  end

  def set_line_item_quantity(line_item_id: , quantity:)
    Vendo::LineItem.new(self).set_item_quantity(line_item_id: line_item_id, quantity: quantity)
  end

  def apply_coupon_code(coupon)
    Vendo::Coupon.new(self).apply_coupon(coupon: coupon)
  end
end
