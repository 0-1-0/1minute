class StatisticsController < ApplicationController
  def show
    @events = Event.find(:all, :order => :sorting_order)
    @activities = Activity.find(:all)
  end
end
