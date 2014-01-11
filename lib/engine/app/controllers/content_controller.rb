class ContentController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :load_section

  def index
  end

  def search
    results = SearchKey.new(Backend, params[:key]).result
    @results = results.paginate(:page => params[:page], :per_page => 20)
  end

  def delete
    RemoveKey.new(Backend, params[:key]).execute
    redirect_to :back
  end

  def change_database
    ChangeDatabase.new(Backend, params[:database]).execute
    redirect_to :back
  end

  private
  def load_section
    @section = 'content'
  end
end



