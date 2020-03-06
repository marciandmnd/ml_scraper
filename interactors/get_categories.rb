require 'selenium-webdriver'
require 'interactor'

class GetCategories
  include Interactor

  def call
    categories = context.wait.until do
      context.driver.find_elements(:css, '#user-list > div.items > div:nth-child(1) > div:nth-child(2) > b > a') 
    end

    puts '======================================='
    puts '======================================='
    puts 'Detected Categories:'
    puts '======================================='
    puts '======================================='

    puts categories.map { |cat| puts cat.text }
  end
end
