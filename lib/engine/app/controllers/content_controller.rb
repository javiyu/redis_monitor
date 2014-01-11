class ContentController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :load_section

  def index
  end

  def search
    @results = Backend.search(params[:key]).paginate(:page => params[:page], :per_page => 20)
  end

  def delete
    Backend.remove(params[:key])
    redirect_to :back
  end

  def change_database
    set_database(params[:database])
    redirect_to :back
  end

  private
  def load_section
    @section = 'content'
  end

  def set_database(database)
    session[:database] = database
    Backend.change_database(database)
  end
end



