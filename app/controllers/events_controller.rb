class EventsController < ApplicationController
  before_action :authenticate_user!, :check_user_is_admin, only: [:create, :new, :edit, :update]
  before_action :set_event, only: [:edit, :show, :update]
  def index
    @events = Event.all
  end

  def show
    @performances = @event.performances.all.include(:user, :event)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event), flash: {success: "event added"}
    else
      render "new", flash: {danger: "Invalid data. ttry again"}
    end

  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event), flash: { success: "Event updated" }
    else
      render "edit", flash: { danger: "Event update failed" }
    end
  end



  private

  def event_params
    params.require(:event).permit(:event_name, :event_description, :publish_at, performer_attributes: Performer.attribute_names.map(&:to_sym).push(:_destroy))
  end


  def set_event
    @event = Event.find([:id])
  end

end

