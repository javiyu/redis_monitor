require 'helpers/base_helper'
require 'helpers/layouts_helper'
require 'helpers/pagination_helper'
require 'helpers/database_helper'

module RedisMonitor
  module Helpers
    module AllHelpers
      include BaseHelper
      include LayoutsHelper
      include PaginationHelper
      include DatabaseHelper
    end
  end
end
