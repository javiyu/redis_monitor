class Notification < ActiveRecord::Base
  default_scope ->{order('created_at DESC')}

  def when
    created_at.localtime.strftime('%Y/%m/%d %H:%M')
  end
end
