class Vendo::Client < Vendo::Base
  attr_accessor :bearer_token, :refresh_token, :vendo_cart
  AUTH_URL = '/spree_oauth/token'
  DEFUALT_USERNAME = "vendo@example.com"
  DEFUALT_PASSWORD = "vendo123"

  include Vendo::Actions

  def auth(username: DEFUALT_USERNAME, password: DEFUALT_PASSWORD)
    response = post(AUTH_URL, {
      body: {
        "grant_type": "password",
        "username": username,
        "password": password
      }
    })
    bearer_token = "Bearer #{response["bearer_token"]}"
    refresh_token = response["refresh_token"]
    !!bearer_token
  end

  def cart_headers
    return vendo_headers unless vendo_cart.present?
    vendo_headers.merge({'X-Vendo-Order-Token': vendo_cart})
  end

  def auth_headers
    a_headers = vendo_headers
    a_header = a_headers.merge({'X-Vendo-Order-Token': vendo_cart}) if vendo_cart.present?
    a_header = a_headers.merge({'Authorization': bearer_token}) if bearer_token.present?
    a_header
  end
end