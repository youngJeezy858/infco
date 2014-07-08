class MachinesController < ApplicationController
  layout "admin_tools"

  # GET /machines
  # GET /machines.json
  def index
    @machines = Machine.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @machines }
    end
  end

  # GET /machines/1
  # GET /machines/1.json
  def show
    @machine = Machine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @machine }
    end
  end

  # GET /machines/new
  # GET /machines/new.json
  def new
    @lab = Lab.find(params[:lab_id])
    @machine = Machine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @machine }
    end
  end

  # GET /machines/1/edit
  def edit
    @lab = Lab.find(params[:lab_id])
    @machine = @lab.machines.find(params[:id])
  end

  # POST /machines
  # POST /machines.json
  def create
    @lab = Lab.find(params[:lab_id])
    @machine = @lab.machines.create(machine_params)

    respond_to do |format|
      if @machine.save
        format.html { redirect_to lab_path(@lab), notice: 'Machine was successfully created.' }
        format.json { render json: @machine, status: :created, location: @machine }
      else
        format.html { render action: "new" }
        format.json { render json: @machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /machines/1
  # PATCH/PUT /machines/1.json
  def update
    @lab = Lab.find(params[:lab_id])
    @machine = @lab.machines.find(params[:id])

    respond_to do |format|
      if @machine.update_attributes(machine_params)
        format.html { redirect_to lab_path(@lab), notice: 'Machine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /machines/1
  # DELETE /machines/1.json
  def destroy
    @lab = Lab.find(params[:lab_id])
    @machine = @lab.machines.find(params[:id])
    @machine.destroy

    respond_to do |format|
      format.html { redirect_to lab_path(@lab) }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def machine_params
      params.require(:machine).permit(:lab, :name)
    end
end
