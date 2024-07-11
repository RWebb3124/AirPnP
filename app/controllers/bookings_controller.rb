class BookingsController < ApplicationController
  before_action :find_pool, only: %i[new create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pool = @pool
    @booking.user = current_user
    if @booking.save
      redirect_to my_bookings_path
    else
      render :new
    end
  end

  def mybookings
    @bookings = Booking.all
    @mybookings = @bookings.where(user_id: current_user)
  end

  def update_status
    puts "its working"
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to my_pools_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :user_id, :id, :status)
  end

  def find_pool
    @pool = Pool.find(params[:id])
  end
end
