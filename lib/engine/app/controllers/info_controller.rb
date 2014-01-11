class InfoController < ApplicationController
  def index
    @section = 'info'
    @info = Backend.info
  end
end
