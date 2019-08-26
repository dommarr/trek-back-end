# frozen_string_literal: true

class TripsController < ProtectedController
  before_action :set_trip, only: %i[update destroy]

  # GET /trips
  def index
    # @trips = Trip.all
    @trips = current_user.trips.all
    render json: @trips
  end

  # GET /trips/1
  def show
    # render json: @trip
    render json: current_user.trips.find(params[:id])
  end

  # POST /trips
  def create
    # @trip = Trip.new(trip_params)
    @trip = current_user.trips.build(trip_params)

    if @trip.save
      render json: @trip, status: :created, location: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trips/1
  def update
    if @trip.update(trip_params)
      render json: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trips/1
  def destroy
    @trip.destroy

    head :no_content
  end

  def set_trip
    @trip = current_user.trips.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:country, :city)
  end

  private :set_trip, :trip_params

end
