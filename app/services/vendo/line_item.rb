class Vendo::LineItem
  attr_accessor :client

  def initialize(client)
    @client = client
  end

  def add_item(variant_id:, quantity:)
    options = {
      headers: client.cart_headers
    }
    options = options.merge({ body: { variant_id: variant_id, quantity: quantity } })
    response = client.post('/api/v2/storefront/cart/add_item', options)

    response
  end

  def remove_item(line_item_id:)
    options = {
      headers: client.cart_headers
    }
    response = client.delete('/api/v2/storefront/cart/remove_line_item', options)

    response
  end

  def set_item_quantity(line_item_id:, quantity:)
    options = {
      headers: client.cart_headers
    }
    options = options.merge({ body: {line_item_id: line_item_id, quantity: quantity}})
    response = client.patch('/api/v2/storefront/cart/set_quantity', options)

    response
  end
end
