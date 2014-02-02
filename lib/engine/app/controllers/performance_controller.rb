class PerformanceController < ApplicationController
  before_action :load_section

  def index
  end

  def check
    @stats = PerformanceStats.new(backend).result
  end

  private
  def load_section
    @section = 'performance'
  end
end