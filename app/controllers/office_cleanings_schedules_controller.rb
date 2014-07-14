class OfficeCleaningsSchedulesController < ApplicationController
  layout 'admin_tools'

  # GET /office_cleanings_schedules
  # GET /office_cleanings_schedules.json
  def index
    @office_cleanings_schedules = OfficeCleaningsSchedule.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @office_cleanings_schedules }
    end
  end

  # GET /office_cleanings_schedules/1
  # GET /office_cleanings_schedules/1.json
  def show
    @office_cleanings_schedule = OfficeCleaningsSchedule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @office_cleanings_schedule }
    end
  end

  # GET /office_cleanings_schedules/new
  # GET /office_cleanings_schedules/new.json
  def new
    @office_cleanings_schedule = OfficeCleaningsSchedule.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @office_cleanings_schedule }
    end
  end

  # GET /office_cleanings_schedules/1/edit
  def edit
    @office_cleanings_schedule = OfficeCleaningsSchedule.find(params[:id])
  end

  # POST /office_cleanings_schedules
  # POST /office_cleanings_schedules.json
  def create
    @office_cleanings_schedule = OfficeCleaningsSchedule.new(office_cleanings_schedule_params)

    respond_to do |format|
      if @office_cleanings_schedule.save
        format.html { redirect_to office_cleanings_schedules_path, notice: 'Office cleanings schedule was successfully created.' }
        format.json { render json: @office_cleanings_schedule, status: :created, location: @office_cleanings_schedule }
      else
        format.html { render action: "new" }
        format.json { render json: @office_cleanings_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /office_cleanings_schedules/1
  # PATCH/PUT /office_cleanings_schedules/1.json
  def update
    @office_cleanings_schedule = OfficeCleaningsSchedule.find(params[:id])

    respond_to do |format|
      if @office_cleanings_schedule.update_attributes(office_cleanings_schedule_params)
        format.html { redirect_to office_cleanings_schedules_path, notice: 'Office cleanings schedule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @office_cleanings_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office_cleanings_schedules/1
  # DELETE /office_cleanings_schedules/1.json
  def destroy
    @office_cleanings_schedule = OfficeCleaningsSchedule.find(params[:id])
    @office_cleanings_schedule.destroy

    respond_to do |format|
      format.html { redirect_to office_cleanings_schedules_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def office_cleanings_schedule_params
      params.require(:office_cleanings_schedule).permit(:end_date, :person, :start_date)
    end
end
