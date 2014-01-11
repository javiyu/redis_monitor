class PerformanceController < ApplicationController
  def index
  end

  def check
    @stats = Backend.performance_stats
  end
end