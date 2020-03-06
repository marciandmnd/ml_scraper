require 'selenium-webdriver'
require 'interactor'

class SearchItem
  include Interactor

  def call
    # fill_form(context.driver, context.wait, context.search_str)
    # submit_form(context.driver, context.wait)
    click_company(context.driver, context.wait, context.a)
    sleep 2
  end

  private

  # def fill_form(driver, wait, search_str)
  #   # Finding search input and writting our variable to it
  #   search_input = wait.until do
  #     driver.find_element(:css, '#user-list > div.items > div:nth-child(1) > div:nth-child(2) > b > a')
  #   end

  #   search_input.send_keys search_str
  # end

  def click_company(driver, wait, a)

      # submit_button = wait.until do
      #   driver.find_element(:css, "#user-list > div.items > div:nth-child(#{a}) > div:nth-child(2) > b > a")
      # end

      company = wait.until do
         driver.find_element(:css, "#user-list > div.items > div:nth-child(#{a}) > div:nth-child(2) > b > a")
      end

      driver.execute_script("arguments[0].scrollIntoView(true);", company)


      #user-list > div.items > div:nth-child(3) > div:nth-child(2) > b > a
      #user-list > div.items > div:nth-child(3) > div:nth-child(2) > b > a

      # submit_button.click
      company.click
  
      sleep 1

      begin 
        name = wait.until do
          driver.find_element(:css, '#mabo-main-content > article > section > address > h1')
        end

        telephone = wait.until do
          driver.find_element(:css, '#mabo-main-content > article > section > address > p:nth-child(6)')
        end

        puts name.text
        puts telephone.text
      rescue 
        
      end
      puts "-------------------------"
        driver.navigate.back

      sleep 1

  end
end
