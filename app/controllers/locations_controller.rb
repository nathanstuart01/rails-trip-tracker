class LocationsController < ApplicationController
  before_action :set_trip
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
    @title = 'Trip Locations'
    @locations = @trip.locations
    flash[:info] = 'Welcome To The Trip Locations'
  end

  def show
    @title = @location.destination
  end

  def new
    @title = 'Add New Location'
    @travel_methods =   Location.travel_methods
    @location = Location.new
  end

  def create
    @location = @trip.locations.new(location_params)
      if @location.save
        flash[:success] = 'New Location Created'
        redirect_to trip_location_path(@trip, @location)
      else
        flash[:error] = 'Please Try Again'
        @travel_methods = Location.travel_methods
        render :new
      end
  end

  def edit
    @title = 'Edit This Location'
    @travel_methods = Location.travel_methods
  end

  def update
    if @location.update(location_params)
      flash[:success] = 'Location Updated'
      redirect_to trip_location_path(@trip, @location)
    else
      flash[:error] = 'Please Try Again'
      @travel_methods = Location.travel_methods
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to trip_locations_path(@trip)
  end

  private
    def location_params
      params.require(:location).permit(:destination, :travel_method, :trip_id)
    end

    def set_trip
      @trip = Trip.find(params[:trip_id])
    end

    def set_location
      @location = @trip.locations.find(params[:id])
    end
end
