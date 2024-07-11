class PoolsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_pool, only: %i[edit update destroy]

  def index
    @pools = Pool.all
    if params[:location].present? || params[:capacity].present?
      @pools = @pools.search_by_address(params[:location]) if params[:location].present?
      @pools = @pools.search_by_capacity(params[:capacity]) if params[:capacity].present?
    end
  end

  def show
    @pool = Pool.find(params[:id])
    @marker = [lat: @pool.latitude, lng: @pool.longitude]
  end

  def new
    @pool = Pool.new
  end

  def mypools
    @mypools = Pool.where(user_id: current_user)
    @bookingrequests = Booking.includes(:pool).where(user_id: current_user, status: 'pending')
    @allbookings = Booking.includes(:pool).where(user_id: current_user, status: 'accepted')
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
