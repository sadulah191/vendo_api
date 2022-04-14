require "spec_helper"
require "rails_helper"

describe Vendo::Client do
  include Stubs

  describe "#line items" do
    let(:client) { Vendo::Client.new }
    before do
      create_line_item_stub
      line_item_qty_stub
      remove_cart_item_stub
    end
    context "line item" do
      it "creates a new line item" do
        response = client.add_line_item(variant_id: "980a80d-5-f51b-4065-b3a0-622fc5cb6bf6", quantity:5)
        line_item = JSON.parse(response)
        expect(response.code).to eq(200)
        expect(line_item["data"]["id"]).to eq("11")
      end

      it "sets a line item quantity" do
        response = client.set_line_item_quantity(line_item_id: "980a80d-5-f51b-4065-b3a0-622fc5cb6bf6", quantity:5)
        line_item = JSON.parse(response)
        expect(response.code).to eq(200)
        expect(line_item["data"]["id"]).to eq("11")
      end

      it "removes a line item" do
        response = client.remove_line_item(line_item_id: "980a80d-5-f51b-4065-b3a0-622fc5cb6bf6")
        line_item = JSON.parse(response)
        expect(response.code).to eq(200)
        expect(line_item["data"]["id"]).to eq("17")
      end
    end
  end
end

