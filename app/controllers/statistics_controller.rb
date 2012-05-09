class StatisticsController < ApplicationController
  def show
    @events = Event.all
    @total = {}
    @total[:money] = 0.0
    @total[:service_fee] = 0.0
    @total[:min] = 0

    @events.each do |e|
      @total[:money] += e.current_money
      @total[:service_fee] += (e.current_service_fee || 0.0)
      @total[:min] += e.current_min
    end
  end
end
