class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new
    @plan.plan_type = params[:plan][:plan_type]
    @plan.start = params[:plan][:start]
    @plan.length = params[:plan][:length]
    @plan.unit = params[:plan][:unit]

    if @plan.save
      flash[:notice] = "Plan was saved."
      redirect_to @plan
    else
      flash.now[:alert] = "There was an error saving the plan. Please try again."
      render :new
    end
  end

  def edit
  end
end
