require 'selenium-webdriver'
require 'interactor'
require_relative 'search_item'
require_relative 'get_titles'
require_relative 'get_categories'

class ScrapingOrganizer
  include Interactor::Organizer

  organize SearchItem, GetCategories, GetTitles
end
