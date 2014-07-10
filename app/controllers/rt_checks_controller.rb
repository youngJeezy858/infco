class RtChecksController < ApplicationController
  # GET /rt_checks
  # GET /rt_checks.json
  def index
    @rt_checks = RtCheck.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rt_checks }
    end
  end

  # GET /rt_checks/1
  # GET /rt_checks/1.json
  def show
    @rt_check = RtCheck.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rt_check }
    end
  end

  # GET /rt_checks/new
  # GET /rt_checks/new.json
  def new
    @rt_check = RtCheck.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rt_check }
    end
  end

  # GET /rt_checks/1/edit
  def edit
    @rt_check = RtCheck.find(params[:id])
  end

  # POST /rt_checks
  # POST /rt_checks.json
  def create
    @operations_check = OperationsCheck.find(params[:operations_check_id])
    @rt_check = RtCheck.create(rt_check_params)
    @rt_check.name = params[:name].to_s

    respond_to do |format|
      if @rt_check.save
        @operations_check.rt_check = @rt_check
        format.html { redirect_to operations_check_path(@operations_check, tab: "rt"), 
          notice: 'RT check was successfully created.' }
        format.json { render json: @rt_check, status: :created, location: @rt_check }
      else
        format.html { redirect_to operations_check_path(@operations_check, tab: "rt"), 
          notice: 'Commit failed - you must give a ticket number if the check failed!' }
        format.json { render json: @rt_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rt_checks/1
  # PATCH/PUT /rt_checks/1.json
  def update
    @operations_check = OperationsCheck.find(params[:operations_check_id])
    @rt_check = @operations_check.rt_checks.find(params[:id])

    respond_to do |format|
      if @rt_check.update_attributes(rt_check_params)
        format.html { redirect_to @rt_check, notice: 'RT check was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rt_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rt_checks/1
  # DELETE /rt_checks/1.json
  def destroy
    operations_check = OperationsCheck.find(params[:operations_check_id])
    @rt_check = RtCheck.find(params[:id])
    @rt_check.destroy

    respond_to do |format|
      format.html { redirect_to operations_check_path(operations_check, tab: "rt") }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def rt_check_params
      params.require(:rt_check).permit(:name, :passed, :ticket)
    end
end
