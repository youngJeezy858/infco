class LdapChecksController < ApplicationController
  # GET /ldap_checks
  # GET /ldap_checks.json
  def index
    @ldap_checks = LdapCheck.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ldap_checks }
    end
  end

  # GET /ldap_checks/1
  # GET /ldap_checks/1.json
  def show
    @ldap_check = LdapCheck.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ldap_check }
    end
  end

  # GET /ldap_checks/new
  # GET /ldap_checks/new.json
  def new
    @ldap_check = LdapCheck.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ldap_check }
    end
  end

  # GET /ldap_checks/1/edit
  def edit
    @ldap_check = LdapCheck.find(params[:id])
  end

  # POST /ldap_checks
  # POST /ldap_checks.json
  def create
    @operations_check = OperationsCheck.find(params[:operations_check_id])
    @ldap_check = @operations_check.ldap_checks.create(ldap_check_params)

    respond_to do |format|
      if @ldap_check.save
        format.html { redirect_to @ldap_check, notice: 'Ldap check was successfully created.' }
        format.json { render json: @ldap_check, status: :created, location: @ldap_check }
      else
        format.html { render action: "new" }
        format.json { render json: @ldap_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ldap_checks/1
  # PATCH/PUT /ldap_checks/1.json
  def update
    @operations_check = OperationsCheck.find(params[:operations_check_id])
    @ldap_check = @operations_check.ldap_checks.find(params[:id])

    respond_to do |format|
      if @ldap_check.update_attributes(ldap_check_params)
        format.html { redirect_to @ldap_check, notice: 'Ldap check was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ldap_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ldap_checks/1
  # DELETE /ldap_checks/1.json
  def destroy
    @ldap_check = LdapCheck.find(params[:id])
    @ldap_check.destroy

    respond_to do |format|
      format.html { redirect_to ldap_checks_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def ldap_check_params
      params.require(:ldap_check).permit(:name)
    end
end
