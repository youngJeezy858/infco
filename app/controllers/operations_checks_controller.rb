class OperationsChecksController < ApplicationController
  # GET /operations_checks
  # GET /operations_checks.json
  def index
    @operations_checks = OperationsCheck.search(params[:search])

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
    @labs_unchecked = Lab.select("name").map(&:name) - 
      @operations_check.lab_checks.select("lab_name").map(&:lab_name)
    @printers = Printer.select("name").map(&:name) - 
      @operations_check.printer_checks.select("name").map(&:name)
    @automounts = Automount.select("name").map(&:name) - 
      @operations_check.automount_checks.select("name").map(&:name)
    @nagios_entries = NagiosEntry.select("name").map(&:name) - 
      @operations_check.nagios_checks.select("name").map(&:name)
    @load_balancers = LoadBalancer.select("name").map(&:name) - 
      @operations_check.load_balancer_checks.select("name").map(&:name)
    @ldap_entries = LdapEntry.select("name").map(&:name) - 
      @operations_check.ldap_checks.select("name").map(&:name)    

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
#    @operations_check.owner = current_user.login
    @operations_check.owner = "kfrank"
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

  def sign_off
    @operations_check = OperationsCheck.find(params[:id])
#    if @operations_check.owner == current_user.login
    if @operations_check.owner == "doesn't matter"
      redirect_to(@operations_check,
                  notice: "Sign off failed - Cannot sign off on a check you created!!!")
    elsif @operations_check.complete?
      redirect_to(@operations_check,
                  notice: "Sign off failed - check is not complete! Commence frying!!!")
    else
#      @operations_check.signed_off_by = current_user.login
      @operations_check.signed_off_by = "bmartin4"
      @operations_check.save
      redirect_to @operations_check, notice: "kfrank has confirmed this check was completed"
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
