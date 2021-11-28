require 'nokogiri'
require 'open-uri'
class CrawlerOne < Product
  def self.crawler
    product = Nokogiri::HTML(URI.open('https://www.mercadolivre.com.br/ofertas?promotion_type=LIGHTNING_DEAL#origin=scut&filter_applied=promotion_type&filter_position=2&is_recommended_domain=false'))

    container = product.css('ol.items_container')

    container.search('a.promotion-item__link-container').each do |item|
      title = item.css('div.promotion-item__container')
                  .css('div.promotion-item__description')
                  .css('p.promotion-item__title').text

      thumb_image = item.css('div.promotion-item__container')
                        .css('img.promotion-item__img').attribute('src').value

      unless thumb_image.include?('http')
        thumb_image = item.css('div.promotion-item__container')
                          .css('img.promotion-item__img').attribute('data-src').value
      end

      link = item.attribute('href')

      price = item.css('div.promotion-item__container')
                  .css('div.promotion-item__description')
                  .css('span.promotion-item__oldprice').text

      origin = 'Mercado Livre'
      Product.create(name: title, thumb_image: thumb_image,
                     content: price, link: link, origin: origin)
      next if item['class'] == 'promotion-item__seller'
    end
  rescue StandardError => e
    puts "error: #{e}"
  end
end
