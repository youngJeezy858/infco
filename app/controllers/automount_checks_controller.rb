class AutomountChecksController < ApplicationController
  # GET /automount_checks
  # GET /automount_checks.json
  def index
    @automount_checks = AutomountCheck.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @automount_checks }
    end
  end

  # GET /automount_checks/1
  # GET /automount_checks/1.json
  def show
    @automount_check = AutomountCheck.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @automount_check }
    end
  end

  # GET /automount_checks/new
  # GET /automount_checks/new.json
  def new
    @automount_check = AutomountCheck.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @automount_check }
    end
  end

  # GET /automount_checks/1/edit
  def edit
    @automount_check = AutomountCheck.find(params[:id])
  end

  # POST /automount_checks
  # POST /automount_checks.json
  def create
    @operations_check = OperationsCheck.find(params[:operations_check_id])
    @automount_check = @operations_check.automount_checks.create(automount_check_params)

    respond_to do |format|
      if @automount_check.save
        format.html { redirect_to @automount_check, notice: 'Automount check was successfully created.' }
        format.json { render json: @automount_check, status: :created, location: @automount_check }
      else
        format.html { render action: "new" }
        format.json { render json: @automount_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /automount_checks/1
  # PATCH/PUT /automount_checks/1.json
  def update
    @operations_check = OperationsCheck.find(params[:operations_check_id])
    @automount_check = @operations_check.automount_checks.find(params[:id])

    respond_to do |format|
      if @automount_check.update_attributes(automount_check_params)
        format.html { redirect_to @automount_check, notice: 'Automount check was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @automount_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /automount_checks/1
  # DELETE /automount_checks/1.json
  def destroy
    @automount_check = AutomountCheck.find(params[:id])
    @automount_check.destroy

    respond_to do |format|
      format.html { redirect_to automount_checks_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def automount_check_params
      params.require(:automount_check).permit(:name)
    end
end
