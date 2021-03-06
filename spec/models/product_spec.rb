require 'rails_helper'

RSpec.describe Product, type: :model do
  category = Category.create(name:"Book")
  subject {
    described_class.new(name: "Love Story",
                      price_cents: 22,
                        quantity: 15,
                        category: category )
  }

  describe 'Validations' do 

    it "should save a valid product" do 
      expect(subject).to (be_valid)
      expect(subject.errors.full_messages).to be_empty
    end 

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).not_to (be_valid)
      expect(subject.errors.full_messages).not_to be_empty
      expect(subject.errors.full_messages).to include "Name can't be blank"

    end
    it "is not valid without a price" do
      subject.price_cents = nil
      expect(subject).not_to (be_valid)
     
      expect(subject.errors.full_messages).to include "Price can't be blank"
    end
    it "is not valid without a quantity" do
      subject.quantity = nil
      expect(subject).not_to (be_valid)
      expect(subject.errors.full_messages).to include "Quantity can't be blank"
    end
    it "is not valid without a category" do 
      subject.category = nil
      expect(subject).not_to (be_valid)
      expect(subject.errors.full_messages).to include "Category can't be blank"
    end 
  end 
end


