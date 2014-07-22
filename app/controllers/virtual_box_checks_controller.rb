class VirtualBoxChecksController < ApplicationController
  # GET /virtual_box_checks
  # GET /virtual_box_checks.json
  def index
    @week = Date.today
    @virtual_box_checks = VirtualBoxCheck.search(params[:week])
    unless params[:week].nil?
      @week = params[:week].to_date
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @virtual_box_checks }
    end
  end

  # GET /virtual_box_checks/1
  # GET /virtual_box_checks/1.json
  def show
    @virtual_box_check = VirtualBoxCheck.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @virtual_box_check }
    end
  end

  # GET /virtual_box_checks/new
  # GET /virtual_box_checks/new.json
  def new
    @virtual_box_check = VirtualBoxCheck.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @virtual_box_check }
    end
  end

  # GET /virtual_box_checks/1/edit
  def edit
    @virtual_box_check = VirtualBoxCheck.find(params[:id])
  end

  # POST /virtual_box_checks
  # POST /virtual_box_checks.json
  def create
    @virtual_box_check = VirtualBoxCheck.new(virtual_box_check_params)
    @virtual_box_check.name = "kfrank"
    @virtual_box_check.date = Date.today - 1.week

    respond_to do |format|
      if @virtual_box_check.save
        format.html { redirect_to @virtual_box_check, notice: 'Virtual box check was successfully created.' }
        format.json { render json: @virtual_box_check, status: :created, location: @virtual_box_check }
      else
        format.html { render action: "new" }
        format.json { render json: @virtual_box_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /virtual_box_checks/1
  # PATCH/PUT /virtual_box_checks/1.json
  def update
    @virtual_box_check = VirtualBoxCheck.find(params[:id])

    respond_to do |format|
      if @virtual_box_check.update_attributes(virtual_box_check_params)
        format.html { redirect_to @virtual_box_check, notice: 'Virtual box check was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @virtual_box_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /virtual_box_checks/1
  # DELETE /virtual_box_checks/1.json
  def destroy
    @virtual_box_check = VirtualBoxCheck.find(params[:id])
    @virtual_box_check.destroy

    respond_to do |format|
      format.html { redirect_to virtual_box_checks_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def virtual_box_check_params
      params.require(:virtual_box_check).permit(:date, :name, :ticket)
    end
end
