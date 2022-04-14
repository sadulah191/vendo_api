require "spec_helper"
require "rails_helper"

describe Vendo::Client do
  include Stubs

  describe "#cart" do
    let(:client) { Vendo::Client.new }

    before do
      retrieve_cart_stub
    end
    context "#create" do
      it "creates a new cart" do
        response = VCR.use_cassette("cart/create") { client.create_cart }
        expect(response["data"]["attributes"]["token"]).not_to be(nil)
      end
    end

    context "#retrieves" do
      it "successfully retrieves a cart" do
        response = client.get_cart
        cart = JSON.parse(response)
        expect(response.code).to eq(200)
        expect(cart["data"]["id"]).to eq("11")
      end
    end
  end
end
