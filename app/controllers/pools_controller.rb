class PoolsController < ApplicationController
  before_action

  def index
    @pools = Pool.all
  end

  def new
    @pool = Pool.new
  end

  def create
    @pool = Pool.new(pool_params)
    @pool.user = @user
    if @pool.save
      redirect_to pools_path
    else
      render :new
    end
  end

  private

  def pool_params
    params.require(:pool).permit(:address, :user_id, :title, :description, :price, :capacity)
  end
end
