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
    @rt_check = RtCheck.new(rt_check_params)

    respond_to do |format|
      if @rt_check.save
        format.html { redirect_to @rt_check, notice: 'Rt check was successfully created.' }
        format.json { render json: @rt_check, status: :created, location: @rt_check }
      else
        format.html { render action: "new" }
        format.json { render json: @rt_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rt_checks/1
  # PATCH/PUT /rt_checks/1.json
  def update
    @rt_check = RtCheck.find(params[:id])

    respond_to do |format|
      if @rt_check.update_attributes(rt_check_params)
        format.html { redirect_to @rt_check, notice: 'Rt check was successfully updated.' }
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
    @rt_check = RtCheck.find(params[:id])
    @rt_check.destroy

    respond_to do |format|
      format.html { redirect_to rt_checks_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def rt_check_params
      params.require(:rt_check).permit(:name)
    end
end
