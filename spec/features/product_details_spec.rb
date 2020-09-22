require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  scenario "See products details" do
    visit '/'
    first('a.btn.btn-default').click
    
    # expect(page).to have_css 'p.product', count: 10
    expect(page).to have_content 'Apparel'
    save_screenshot
  end 
end
