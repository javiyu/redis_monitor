class PerformanceController < ApplicationController
  def index
  end

  def check
    @stats = PerformanceStats.new(Backend).result
  end
end