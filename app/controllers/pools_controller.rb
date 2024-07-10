class PoolsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_pool, only: [:edit, :update, :destroy]

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
    @mypools = Pool.where(user_id: current_user)
  end

  def create
    @pool = Pool.new(pool_params)
    @pool.user = current_user
    if @pool.save
      redirect_to my_pools_path
    else
      render :new
    end
  end

  def edit
    @pool
  end

  def update
    if @pool.update(pool_params)
      redirect_to my_pools_path, notice: 'Pool was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @pool = Pool.find(params[:id])
    @pool.destroy
    redirect_to my_pools_path, notice: 'Pool was successfully destroyed.'
  end

 private

  def set_pool
    @pool = Pool.find(params[:id])
  end

  def pool_params
    params.require(:pool).permit(:address, :user_id, :title, :description, :price, :capacity, :photo)
  end
end
