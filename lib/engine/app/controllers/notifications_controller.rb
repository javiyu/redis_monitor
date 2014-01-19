class NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :load_section

  def index
    @notifications = Notification.all
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