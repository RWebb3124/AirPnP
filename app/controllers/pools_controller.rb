class PoolsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @pools = Pool.all
  end

  def show
    @pool = Pool.find(params[:id])
  end

  def new
    @pool = Pool.new
  end

  def mypools
    @pools = Pool.all
    @mypools = @pools.where(user_id: current_user)
  end

  def create
    @pool = Pool.new(pool_params)
    @pool.user = current_user
    if @pool.save
      redirect_to pools_path
    else
      render :new
    end
  end

  private

  def pool_params
    params.require(:pool).permit(:address, :user_id, :title, :description, :price, :capacity, :photo)
  end
end
