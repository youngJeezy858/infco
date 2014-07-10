class OperationsChecksController < ApplicationController
  # GET /operations_checks
  # GET /operations_checks.json
  def index
    @operations_checks = OperationsCheck.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @operations_checks }
    end
  end

  # GET /operations_checks/1
  # GET /operations_checks/1.json
  def show
    @operations_check = OperationsCheck.find(params[:id])
    @labs = Lab.all
    @labs_unchecked = Lab.select("name").map(&:name) - @operations_check.lab_checks.select("lab_name").map(&:lab_name)
    @printers = Printer.select("name").map(&:name) - @operations_check.printer_checks.select("name").map(&:name)
    @automounts = Automount.select("name").map(&:name) - @operations_check.automount_checks.select("name").map(&:name)
    @nagios_entries = NagiosEntry.all
    @load_balancers = LoadBalancer.all
    @ldap_entries = LdapEntry.all    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @operations_check }
    end
  end

  # GET /operations_checks/new
  # GET /operations_checks/new.json
  def new
    @operations_check = OperationsCheck.new
    @operations_check.date = DateTime.now
    @operations_check.owner = "kfrank"
    ## @internal_check.owner = current_user.login 
    @operations_check.save
    redirect_to @operations_check, notice: 'Operations check was successfully created.'
  end

  # GET /operations_checks/1/edit
  def edit
    @operations_check = OperationsCheck.find(params[:id])
  end

  # POST /operations_checks
  # POST /operations_checks.json
  def create
    @operations_check = OperationsCheck.new(operations_check_params)

    respond_to do |format|
      if @operations_check.save
        format.html { redirect_to @operations_check, notice: 'Operations check was successfully created.' }
        format.json { render json: @operations_check, status: :created, location: @operations_check }
      else
        format.html { render action: "new" }
        format.json { render json: @operations_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operations_checks/1
  # PATCH/PUT /operations_checks/1.json
  def update
    @operations_check = OperationsCheck.find(params[:id])

    respond_to do |format|
      if @operations_check.update_attributes(operations_check_params)
        format.html { redirect_to @operations_check, notice: 'Operations check was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @operations_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operations_checks/1
  # DELETE /operations_checks/1.json
  def destroy
    @operations_check = OperationsCheck.find(params[:id])
    @operations_check.destroy

    respond_to do |format|
      format.html { redirect_to operations_checks_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def operations_check_params
      params.require(:operations_check).permit(:date, :string)
    end
end
