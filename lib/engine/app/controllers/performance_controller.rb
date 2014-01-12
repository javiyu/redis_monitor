class PerformanceController < ApplicationController
  def index
  end

  def check
    @stats = PerformanceStats.new(backend).result
  end
end