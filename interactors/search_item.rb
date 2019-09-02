require 'selenium-webdriver'
require 'interactor'

class SearchItem
  include Interactor

  def call
    fill_form(context.driver, context.wait, context.search_str)
    submit_form(context.driver, context.wait)
    sleep 2
  end

  private

  def fill_form(driver, wait, search_str)
    # Finding search input and writting our variable to it
    search_input = wait.until do
      driver.find_element(:css, 'body > header > div > form > input')
    end

    search_input.send_keys search_str
  end

  def submit_form(driver, wait)
    # Clicking the form's submit button
    submit_button = wait.until do
      driver.find_element(:css, 'button.nav-search-btn')
    end

    submit_button.click
  end
end
