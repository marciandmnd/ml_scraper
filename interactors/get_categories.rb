require 'selenium-webdriver'
require 'interactor'

class GetCategories
  include Interactor

  def call
    categories = context.wait.until do
      context.driver.find_elements(:css, '.breadcrumb__path > a > span') 
    end

    puts '======================================='
    puts '======================================='
    puts 'Detected Categories:'
    puts '======================================='
    puts '======================================='

    puts categories.map { |cat| puts cat.text }
  end
end
