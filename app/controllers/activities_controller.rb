# frozen_string_literal: true

class ActivitiesController < ProtectedController
  before_action :set_activity, only: %i[update destroy]

  # GET /activities
  def index
    #@activities = Activity.all
    @activities = current_user.activities.all

    render json: @activities
  end

  # GET /activities/1
  def show
    # render json: @activity
    render json: current_user.activities.find(params[:id])
  end

  # POST /activities
  def create
    # @activity = Activity.new(activity_params)
    @activity = current_user.activities.build(activity_params)

    if @activity.save
      render json: @activity, status: :created, location: @activity
    else
      render json: @activity.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /activities/1
  def update
    if @activity.update(activity_params)
      render json: @activity
    else
      render json: @activity.errors, status: :unprocessable_entity
    end
  end

  # DELETE /activities/1
  def destroy
    @activity.destroy

    head :no_content
  end

  def set_activity
    @activity = current_user.activities.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:begin_date, :end_date, :activity_title, :trip_id, :user_id)
  end

  private :set_activity, :activity_params

end
