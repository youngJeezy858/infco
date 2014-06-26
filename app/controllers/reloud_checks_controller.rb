class ReloudChecksController < ApplicationController
  layout "internal_checks"

  # GET /reloud_checks
  # GET /reloud_checks.json
  def index
    @reloud_checks = ReloudCheck.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reloud_checks }
    end
  end

  # GET /reloud_checks/1
  # GET /reloud_checks/1.json
  def show
    @reloud_check = ReloudCheck.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reloud_check }
    end
  end

  # GET /reloud_checks/new
  # GET /reloud_checks/new.json
  def new
    @reloud_check = ReloudCheck.new
    @reloud_entries = ReloudEntry.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reloud_check }
    end
  end

  # GET /reloud_checks/1/edit
  def edit
    @reloud_check = ReloudCheck.find(params[:id])
  end

  # POST /reloud_checks
  # POST /reloud_checks.json
  def create
    @reloud_check = ReloudCheck.new(reloud_check_params)
    @reloud_check.date = Date.today
    @reloud_check.owner = "kfrank"

    respond_to do |format|
      if @reloud_check.save
        format.html { redirect_to reloud_checks_path, notice: 'Reloud check was successfully created.' }
        format.json { render json: @reloud_check, status: :created, location: @reloud_check }
      else
        format.html { render action: "new" }
        format.json { render json: @reloud_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reloud_checks/1
  # PATCH/PUT /reloud_checks/1.json
  def update
    @reloud_check = ReloudCheck.find(params[:id])

    respond_to do |format|
      if @reloud_check.update_attributes(reloud_check_params)
        format.html { redirect_to @reloud_check, notice: 'Reloud check was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reloud_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reloud_checks/1
  # DELETE /reloud_checks/1.json
  def destroy
    @reloud_check = ReloudCheck.find(params[:id])
    @reloud_check.destroy

    respond_to do |format|
      format.html { redirect_to reloud_checks_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def reloud_check_params
      params.require(:reloud_check).permit(:date, :name, :owner)
    end
end
