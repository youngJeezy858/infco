class LoadBalancerChecksController < ApplicationController
  # GET /load_balancer_checks
  # GET /load_balancer_checks.json
  def index
    @load_balancer_checks = LoadBalancerCheck.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @load_balancer_checks }
    end
  end

  # GET /load_balancer_checks/1
  # GET /load_balancer_checks/1.json
  def show
    @load_balancer_check = LoadBalancerCheck.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @load_balancer_check }
    end
  end

  # GET /load_balancer_checks/new
  # GET /load_balancer_checks/new.json
  def new
    @load_balancer_check = LoadBalancerCheck.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @load_balancer_check }
    end
  end

  # GET /load_balancer_checks/1/edit
  def edit
    @load_balancer_check = LoadBalancerCheck.find(params[:id])
  end

  # POST /load_balancer_checks
  # POST /load_balancer_checks.json
  def create
    @operations_check = OperationsCheck.find(params[:operations_check_id])
    @load_balancer_check = @operations_check.load_balancer_checks.create(load_balancer_check_params)

    respond_to do |format|
      if @load_balancer_check.save
        format.html { redirect_to @load_balancer_check, notice: 'Load balancer check was successfully created.' }
        format.json { render json: @load_balancer_check, status: :created, location: @load_balancer_check }
      else
        format.html { render action: "new" }
        format.json { render json: @load_balancer_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /load_balancer_checks/1
  # PATCH/PUT /load_balancer_checks/1.json
  def update
    @operations_check = OperationsCheck.find(params[:operations_check_id])
    @load_balancer_check = @operations_check.load_balancer_checks.find(params[:id])

    respond_to do |format|
      if @load_balancer_check.update_attributes(load_balancer_check_params)
        format.html { redirect_to @load_balancer_check, notice: 'Load balancer check was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @load_balancer_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /load_balancer_checks/1
  # DELETE /load_balancer_checks/1.json
  def destroy
    @load_balancer_check = LoadBalancerCheck.find(params[:id])
    @load_balancer_check.destroy

    respond_to do |format|
      format.html { redirect_to load_balancer_checks_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def load_balancer_check_params
      params.require(:load_balancer_check).permit(:name)
    end
end
