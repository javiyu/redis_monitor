class InfoController < ApplicationController
  def index
    @section = 'info'
    @info = backend.info
  end
end
