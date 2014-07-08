class LoadBalancersController < ApplicationController
  layout 'admin_tools'

  # GET /load_balancers
  # GET /load_balancers.json
  def index
    @load_balancers = LoadBalancer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @load_balancers }
    end
  end

  # GET /load_balancers/1
  # GET /load_balancers/1.json
  def show
    @load_balancer = LoadBalancer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @load_balancer }
    end
  end

  # GET /load_balancers/new
  # GET /load_balancers/new.json
  def new
    @load_balancer = LoadBalancer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @load_balancer }
    end
  end

  # GET /load_balancers/1/edit
  def edit
    @load_balancer = LoadBalancer.find(params[:id])
  end

  # POST /load_balancers
  # POST /load_balancers.json
  def create
    @load_balancer = LoadBalancer.new(load_balancer_params)

    respond_to do |format|
      if @load_balancer.save
        format.html { redirect_to load_balancers_path, notice: 'Load balancer was successfully created.' }
        format.json { render json: @load_balancer, status: :created, location: @load_balancer }
      else
        format.html { render action: "new" }
        format.json { render json: @load_balancer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /load_balancers/1
  # PATCH/PUT /load_balancers/1.json
  def update
    @load_balancer = LoadBalancer.find(params[:id])

    respond_to do |format|
      if @load_balancer.update_attributes(load_balancer_params)
        format.html { redirect_to load_balancers_path, notice: 'Load balancer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @load_balancer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /load_balancers/1
  # DELETE /load_balancers/1.json
  def destroy
    @load_balancer = LoadBalancer.find(params[:id])
    @load_balancer.destroy

    respond_to do |format|
      format.html { redirect_to load_balancers_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def load_balancer_params
      params.require(:load_balancer).permit(:name)
    end
end
