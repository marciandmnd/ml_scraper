require 'selenium-webdriver'
require 'interactor'
require_relative 'interactors/scraping_organizer'

class MlScraper
  def initialize
    # Initilize the driver with our desired browser
    @driver = Selenium::WebDriver.for :chrome

    # Define search string
    @search_str = 'Cairo'

    # Navigate to mercadolibre
    @driver.get 'https://www.egypt-business.com/company/katalog/it-telecom/call-centers'

    # Define global timeout threshold
    @wait = Selenium::WebDriver::Wait.new(timeout: 10) # seconds
  end

  def scrape
    
    for a in 1..50 do
    ScrapingOrganizer.call(
      driver: @driver,
      wait: @wait,
      search_str: @search_str,
      a: a
    )
    end
    @driver.quit
  end
end

# Run program
MlScraper.new.scrape
