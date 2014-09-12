class LoudChecksController < ApplicationController
  # GET /loud_checks
  # GET /loud_checks.json
  def index
    @week = DateTime.now
    unless params[:week].nil?
      @week = params[:week].to_date
    end
    @loud_checks = LoudCheck.search(params[:week])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @loud_checks }
    end
  end

  # GET /loud_checks/1
  # GET /loud_checks/1.json
  def show
    @loud_check = LoudCheck.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @loud_check }
    end
  end

  # GET /loud_checks/new
  # GET /loud_checks/new.json
  def new
    @loud_check = LoudCheck.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @loud_check }
    end
  end

  # GET /loud_checks/1/edit
  def edit
    @loud_check = LoudCheck.find(params[:id])
  end

  # POST /loud_checks
  # POST /loud_checks.json
  def create
    @loud_check = LoudCheck.new(loud_check_params)
    @loud_check.name = current_user.login

    respond_to do |format|
      if @loud_check.save
        format.html { redirect_to @loud_check, notice: 'LOUD check was successfully created.' }
        format.json { render json: @loud_check, status: :created, location: @loud_check }
      else
        format.html { render action: "new" }
        format.json { render json: @loud_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loud_checks/1
  # PATCH/PUT /loud_checks/1.json
  def update
    @loud_check = LoudCheck.find(params[:id])

    respond_to do |format|
      if @loud_check.update_attributes(loud_check_params)
        format.html { redirect_to @loud_check, notice: 'LOUD check was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @loud_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loud_checks/1
  # DELETE /loud_checks/1.json
  def destroy
    @loud_check = LoudCheck.find(params[:id])
    @loud_check.destroy

    respond_to do |format|
      format.html { redirect_to loud_checks_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def loud_check_params
      params.require(:loud_check).permit(:name, :ticket)
    end
end
