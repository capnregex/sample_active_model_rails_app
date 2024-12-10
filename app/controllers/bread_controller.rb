class BreadController < ApplicationController
  before_action :set_bread

  def show
  end

  def create
    render :show
  end

  private

  def set_bread
    @bread = Bread.new(bread_params)
  end

  def bread_params
    params.fetch(:bread, {}).permit(:a, :b)
  end
end
