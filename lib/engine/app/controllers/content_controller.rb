class ContentController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :load_section
  before_action :load_database_list, only: [:index, :search]
  before_action :load_current_database, only: [:index, :search]

  def index
  end

  def search
    results = SearchKeys.new(backend, params[:key]).result
    @results = results.paginate(:page => params[:page], :per_page => 20)
  end

  def delete
    RemoveKey.new(backend, params[:key]).execute
    redirect_to :back
  end

  def change_database
    ChangeDatabase.new(backend, session, params[:database]).execute
    redirect_to :back
  end

  private
  def load_section
    @section = 'content'
  end

  def load_database_list
    @databases = DatabaseList.new(backend).result
  end

  def load_current_database
    @current_database = backend.current_database
  end
end



