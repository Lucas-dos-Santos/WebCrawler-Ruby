class PagesController < ApplicationController
  def products
    @products = Product.all
  end

  def crawler
    Product.delete_all
    CrawlerOne.crawler
    redirect_to action: :products
  end
end
