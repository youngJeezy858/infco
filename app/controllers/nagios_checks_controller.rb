class NagiosChecksController < ApplicationController
  # GET /nagios_checks
  # GET /nagios_checks.json
  def index
    @nagios_checks = NagiosCheck.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nagios_checks }
    end
  end

  # GET /nagios_checks/1
  # GET /nagios_checks/1.json
  def show
    @nagios_check = NagiosCheck.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @nagios_check }
    end
  end

  # GET /nagios_checks/new
  # GET /nagios_checks/new.json
  def new
    @nagios_check = NagiosCheck.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @nagios_check }
    end
  end

  # GET /nagios_checks/1/edit
  def edit
    @nagios_check = NagiosCheck.find(params[:id])
  end

  # POST /nagios_checks
  # POST /nagios_checks.json
  def create
    @operations_check = OperationsCheck.find(params[:operations_check_id])
    @nagios_check = @operations_check.nagios_checks.create(nagios_check_params)

    respond_to do |format|
      if @nagios_check.save
        format.html { redirect_to operations_check_path(@operations_check, tab: "nagios"), 
          notice: 'Nagios check was successfully created.' }
        format.json { render json: @nagios_check, status: :created, location: @nagios_check }
      else
        format.html { redirect_to operations_check_path(@operations_check, tab: "nagios"), 
          notice: 'Commit Failed - You need to give a ticket number if the check failed!' } 
        format.json { render json: @nagios_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nagios_checks/1
  # PATCH/PUT /nagios_checks/1.json
  def update
    @operations_check = OperationsCheck.find(params[:operations_check_id])
    @lab_check = @operations_check.lab_checks.find(params[:id])

    respond_to do |format|
      if @nagios_check.update_attributes(nagios_check_params)
        format.html { redirect_to @nagios_check, notice: 'Nagios check was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @nagios_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nagios_checks/1
  # DELETE /nagios_checks/1.json
  def destroy
    operations_check = OperationsCheck.find(params[:operations_check_id])
    @nagios_check = NagiosCheck.find(params[:id])
    @nagios_check.destroy

    respond_to do |format|
      format.html { redirect_to operations_check_path(operations_check, tab: "nagios")}
      format.json { head :no_content }
    end
  end

  def mass_create
    @operations_check = OperationsCheck.find(params[:operations_check_id])
    params[:checks].each do |i, values|
      @nagios_check = @operations_check.nagios_checks.create(values)
      unless @nagios_check.save
        redirect_to operations_check_path(@operations_check.id, tab:"nagios"),
          notice: "Commit failed for #{values[:name]}- You need to give a ticket number if the check failed!"
        return
      end
    end
    redirect_to operations_check_path(@operations_check.id, tab:"nagios"),
       notice: 'nagios checks were successfully created.'
  end

  private
    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def nagios_check_params
      params.require(:nagios_check).permit(:name, :passed, :ticket)
    end
end
