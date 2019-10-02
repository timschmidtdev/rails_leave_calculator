class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
