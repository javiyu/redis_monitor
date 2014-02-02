class NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :load_section

  def index
    @notifications = Notification.paginate(:page => params[:page], :per_page => 20)
  end

  def destroy
    notification = Notification.find(params[:id])
    notification.destroy
    redirect_to action: :index
  end

  private
  def load_section
    @section = 'notifications'
  end
end