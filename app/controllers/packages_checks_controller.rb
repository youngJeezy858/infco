class PackagesChecksController < ApplicationController
  # GET /packages_checks
  # GET /packages_checks.json
  def index
    @packages_checks = PackagesCheck.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @packages_checks }
    end
  end

  # GET /packages_checks/1
  # GET /packages_checks/1.json
  def show
    @packages_check = PackagesCheck.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @packages_check }
    end
  end

  # GET /packages_checks/new
  # GET /packages_checks/new.json
  def new
    @packages_check = PackagesCheck.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @packages_check }
    end
  end

  # GET /packages_checks/1/edit
  def edit
    @packages_check = PackagesCheck.find(params[:id])
  end

  # POST /packages_checks
  # POST /packages_checks.json
  def create
    @operations_check = OperationsCheck.find(params[:operations_check_id])
    @packages_check = @operations_check.packages_checks.create(packages_check_params)

    respond_to do |format|
      if @packages_check.save
        format.html { redirect_to @packages_check, notice: 'Packages check was successfully created.' }
        format.json { render json: @packages_check, status: :created, location: @packages_check }
      else
        format.html { render action: "new" }
        format.json { render json: @packages_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /packages_checks/1
  # PATCH/PUT /packages_checks/1.json
  def update
    @operations_check = OperationsCheck.find(params[:operations_check_id])
    @packages_check = @operations_check.packages_checks.find(params[:id])

    respond_to do |format|
      if @packages_check.update_attributes(packages_check_params)
        format.html { redirect_to @packages_check, notice: 'Packages check was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @packages_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packages_checks/1
  # DELETE /packages_checks/1.json
  def destroy
    @packages_check = PackagesCheck.find(params[:id])
    @packages_check.destroy

    respond_to do |format|
      format.html { redirect_to packages_checks_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def packages_check_params
      params.require(:packages_check).permit(:name)
    end
end
