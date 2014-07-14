class ReloudSchedulesController < ApplicationController
  layout 'admin_tools'
  
  # GET /reloud_schedules
  # GET /reloud_schedules.json
  def index
    @reloud_schedules = ReloudSchedule.all
    @reloud_entries = ReloudEntry.select("name").map(&:name) -
      ReloudSchedule.select("machine_name").map(&:machine_name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reloud_schedules }
    end
  end

  # GET /reloud_schedules/1
  # GET /reloud_schedules/1.json
  def show
    @reloud_schedule = ReloudSchedule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reloud_schedule }
    end
  end

  # GET /reloud_schedules/new
  # GET /reloud_schedules/new.json
  def new
    @reloud_schedule = ReloudSchedule.new
    @reloud_entries = ReloudEntry.select("name").map(&:name) -
      ReloudSchedule.select("machine_name").map(&:machine_name)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reloud_schedule }
    end
  end

  # GET /reloud_schedules/1/edit
  def edit
    @reloud_schedule = ReloudSchedule.find(params[:id])
    @reloud_entries = ReloudEntry.select("name").map(&:name) -
      ReloudSchedule.select("machine_name").find(:all, :conditions => [ "machine_name != ?", @reloud_schedule.machine_name ]).map(&:machine_name) 
  end

  # POST /reloud_schedules
  # POST /reloud_schedules.json
  def create
    @reloud_schedule = ReloudSchedule.new(reloud_schedule_params)

    respond_to do |format|
      if @reloud_schedule.save
        format.html { redirect_to reloud_schedules_path, notice: 'Reloud schedule was successfully created.' }
        format.json { render json: @reloud_schedule, status: :created, location: @reloud_schedule }
      else
        format.html { render action: "new" }
        format.json { render json: @reloud_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reloud_schedules/1
  # PATCH/PUT /reloud_schedules/1.json
  def update
    @reloud_schedule = ReloudSchedule.find(params[:id])

    respond_to do |format|
      if @reloud_schedule.update_attributes(reloud_schedule_params)
        format.html { redirect_to reloud_schedules_path, notice: 'Reloud schedule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reloud_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reloud_schedules/1
  # DELETE /reloud_schedules/1.json
  def destroy
    @reloud_schedule = ReloudSchedule.find(params[:id])
    @reloud_schedule.destroy

    respond_to do |format|
      format.html { redirect_to reloud_schedules_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def reloud_schedule_params
      params.require(:reloud_schedule).permit(:machine_name, :person)
    end
end
