class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @title = 'Trips'
    @trips = current_user.trips
    flash[:info] = 'Welcome To The Trip Tracker'
  end

  def show
    @title = current_user.trips.name
    @locations = @trip.locations.all
  end

  def new
    @title = 'Add New Trip'
    @trip = current_user.trips.new
  end

  def create
    @trip = current_user.trips.new(trip_params)
    if @trip.save
      flash[:success] = 'New Trip Created'
      redirect_to trip_path(@trip)
    else
      flash[:error] = 'Please Try Again'
      render :new
    end
  end

  def edit
    @title = 'Edit This Trip'
  end

  def update
    if @trip.update(trip_params)
      flash[:success] = 'Trip Updated'
      redirect_to trip_path(@trip)
    else
      flash[:error] = 'Please Try Again'
      render :edit
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_path
  end

  private
    def trip_params
      params.require(:trip).permit(:name)
    end

    def set_trip
      @trip = Trip.find(params[:id])
    end
end
