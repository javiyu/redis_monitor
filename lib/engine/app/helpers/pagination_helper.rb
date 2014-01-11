module PaginationHelper
  def bootstrap_paginate(results)
    will_paginate results, renderer: BootstrapPagination::Rails
  end
end

