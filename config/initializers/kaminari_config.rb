# frozen_string_literal: true

Kaminari.configure do |config|
  config.default_per_page = 100   # Matches your controller's .per(100)
  config.max_per_page = 1000
  config.window = 3               # Number of links before and after current page
  config.outer_window = 1         # Number of links at the beginning and end
  config.left = 0
  config.right = 0
  config.page_method_name = :page
  config.param_name = :page
end
