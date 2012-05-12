class StatisticsController < ApplicationController
  def show
    @events = Event.all
  end
end
