module Vendo::Actions
  def create_cart
    Vendo::Cart.new(self).create
  end
end