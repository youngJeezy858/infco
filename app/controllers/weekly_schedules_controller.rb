class WeeklySchedulesController < ApplicationController
  layout 'admin_tools'

  # GET /weekly_schedules
  # GET /weekly_schedules.json
  def index
    @weekly_schedules = WeeklySchedule.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @weekly_schedules }
    end
  end

  # GET /weekly_schedules/1
  # GET /weekly_schedules/1.json
  def show
    @weekly_schedule = WeeklySchedule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @weekly_schedule }
    end
  end

  # GET /weekly_schedules/new
  # GET /weekly_schedules/new.json
  def new
    @weekly_schedule = WeeklySchedule.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @weekly_schedule }
    end
  end

  # GET /weekly_schedules/1/edit
  def edit
    @weekly_schedule = WeeklySchedule.find(params[:id])
  end

  # POST /weekly_schedules
  # POST /weekly_schedules.json
  def create
    @weekly_schedule = WeeklySchedule.new(weekly_schedule_params)

    respond_to do |format|
      if @weekly_schedule.save
        format.html { redirect_to weekly_schedules_path, notice: 'Weekly schedule was successfully created.' }
        format.json { render json: @weekly_schedule, status: :created, location: @weekly_schedule }
      else
        format.html { render action: "new" }
        format.json { render json: @weekly_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weekly_schedules/1
  # PATCH/PUT /weekly_schedules/1.json
  def update
    @weekly_schedule = WeeklySchedule.find(params[:id])

    respond_to do |format|
      if @weekly_schedule.update_attributes(weekly_schedule_params)
        format.html { redirect_to weekly_schedules_path, notice: 'Weekly schedule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @weekly_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weekly_schedules/1
  # DELETE /weekly_schedules/1.json
  def destroy
    @weekly_schedule = WeeklySchedule.find(params[:id])
    @weekly_schedule.destroy

    respond_to do |format|
      format.html { redirect_to weekly_schedules_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def weekly_schedule_params
      params.require(:weekly_schedule).permit(:friday, :monday, :name, :thursday, :tuesday, :wednesday)
    end
end
