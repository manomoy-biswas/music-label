class HomeController < ApplicationController
  def index
    @events = Event.last(10)
  end

  def overview
  end
end
