class LabChecksController < ApplicationController
  # GET /lab_checks
  # GET /lab_checks.json
  def index
    @lab_checks = LabCheck.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lab_checks }
    end
  end

  # GET /lab_checks/1
  # GET /lab_checks/1.json
  def show
    @lab_check = LabCheck.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lab_check }
    end
  end

  # GET /lab_checks/new
  # GET /lab_checks/new.json
  def new
    @lab_check = LabCheck.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lab_check }
    end
  end

  # GET /lab_checks/1/edit
  def edit
    @lab_check = LabCheck.find(params[:id])
  end

  # POST /lab_checks
  # POST /lab_checks.json
  def create
    @lab_check = LabCheck.new(lab_check_params)

    respond_to do |format|
      if @lab_check.save
        format.html { redirect_to @lab_check, notice: 'Lab check was successfully created.' }
        format.json { render json: @lab_check, status: :created, location: @lab_check }
      else
        format.html { render action: "new" }
        format.json { render json: @lab_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lab_checks/1
  # PATCH/PUT /lab_checks/1.json
  def update
    @lab_check = LabCheck.find(params[:id])

    respond_to do |format|
      if @lab_check.update_attributes(lab_check_params)
        format.html { redirect_to @lab_check, notice: 'Lab check was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lab_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lab_checks/1
  # DELETE /lab_checks/1.json
  def destroy
    @lab_check = LabCheck.find(params[:id])
    @lab_check.destroy

    respond_to do |format|
      format.html { redirect_to lab_checks_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def lab_check_params
      params.require(:lab_check).permit(:completed, :lab_name, :machine1_name, :machine2_name, :machine3_name)
    end
end
