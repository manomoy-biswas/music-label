class PerformancesController < ApplicationController
  before_action :authenticate_user!, :check_user_is_admin, only: [:create, :destroy, :edit, :new, :update]
  before_action :set_performance, only: [:destroy, :edit, :show, :update]
  
  def create 
    @performance  = Parformance.new(paerformance_params)
    @performance.user_id = current_user.id
    @performance.event_id = @event.id

    if @parformance.save
      redirect_to event_performance_path(@performance), flash: { success: "Performance added" }
    else
      render "new"
    end
  end
  
  def destroy
    if @performance.destroy
      redirect_to request.referrer, flash: { success: "performance deleted" }
    else
      redirect_to request.referrer, flash: { danger: "something went wrong" }
    end
  end

  def edit
  end
  
  def new
    @performance = Performance.new
  end


  def show
    @comment = Comment.new
    @comment.performance_id = @performance.id
    @comments = @performance.comments.order("id DESC")
  end

  def update
    if @performance.update(performance_params)
      redirect_to event_performance_path(@performance), flash: {success: "performance updated" }
    else
      redirect_to event_performance_path(@performance), flash: {danger: "something went wrong" }
    end
  end

  private

  def paerformance_params
    params.require(:performance).permit(:title, :description, :attachment)
  end

  def set_performance
    @performance = Performance.find([:id])
  end
end
