require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    describe 'golden path' do
      it "all fields should save if not nil" do
        cat1 = Category.find_or_create_by! name: 'Apparel'
        positive_product = cat1.products.create({
          name: "Sunglasses",
          description: "They are sunny",
          quantity: 200,
          price: 50.00
        })
        expect(positive_product).to be_valid
        expect(positive_product.errors.messages).to be_empty
      end
    end
    describe '#name' do
      it "should ensure that name is populated" do
        cat2 = Category.find_or_create_by! name: 'Apparel'
        no_name = cat2.products.create({
          name: nil,
          description: "It is quite silly",
          quantity: 200,
          price: 50.00
        })
        expect(no_name).not_to be_valid
        # expect(no_name.errors.messages).to include({name: ["can't be blank"]})
        expect(no_name.errors.full_messages).to eq(["Name can't be blank"])
      end
    end

    describe '#price' do
      it "should ensure that price is populated" do
        cat = Category.find_or_create_by! name: 'Apparel'
        no_price = cat.products.create({
          name: 'woo',
          description: "It is quite silly",
          quantity: 200,
          price: nil
        })
        expect(no_price).not_to be_valid
        expect(no_price.errors.full_messages).to eq(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
      end
    end

    describe '#quantity' do
      it "should ensure that quantity is populated" do
        cat = Category.find_or_create_by! name: 'Apparel'
        no_quantity = cat.products.create({
          name: 'woo',
          description: "It is quite silly",
          quantity: nil,
          price: 40.00
        })
        expect(no_quantity).not_to be_valid
        expect(no_quantity.errors.full_messages).to eq(["Quantity can't be blank"])
      end
    end

    describe '#category' do
      it "should ensure that category is populated" do
        no_cat = Product.create({
          name: 'woo',
          description: "It is quite silly",
          quantity: 123,
          price: 40.00,
          category_id: nil
        })
        expect(no_cat).not_to be_valid
        expect(no_cat.errors.full_messages).to eq(["Category can't be blank"])
      end
    end
  end
end
