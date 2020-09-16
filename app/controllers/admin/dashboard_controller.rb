class Admin::DashboardController < ApplicationController
  def show
    @count_products = Product.count
    @count_cats = Category.count
  end
end
