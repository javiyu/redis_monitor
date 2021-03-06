require 'will_paginate-bootstrap'

module PaginationHelper
  def bootstrap_paginate(results)
    will_paginate results, renderer: BootstrapPagination::Rails, previous_label: '<<', next_label: '>>'
  end
end

