class SpaceChecksController < ApplicationController
  # GET /space_checks
  # GET /space_checks.json
  def index
    @space_checks = SpaceCheck.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @space_checks }
    end
  end

  # GET /space_checks/1
  # GET /space_checks/1.json
  def show
    @space_check = SpaceCheck.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @space_check }
    end
  end

  # GET /space_checks/new
  # GET /space_checks/new.json
  def new
    @space_check = SpaceCheck.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @space_check }
    end
  end

  # GET /space_checks/1/edit
  def edit
    @space_check = SpaceCheck.find(params[:id])
  end

  # POST /space_checks
  # POST /space_checks.json
  def create
    @internal_check = InternalCheck.find(params[:internal_check_id])
    @space_check = @internal_check.space_checks.create(params[:space_check])
    
    unless @space_check.name.present?
      @space_check.destroy
      redirect_to @internal_check, 
      notice: 'Please provide the name of the instance you are reporting.'
      return 
    end

    
    respond_to do |format|
      if @space_check.save
        @internal_check.passed = "false"
        @internal_check.save
        format.html { redirect_to @internal_check, notice: 'Disk space failure successfully reported.' }
        format.json { render json: @space_check, status: :created, location: @space_check }
      else
        format.html { render action: "new" }
        format.json { render json: @space_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /space_checks/1
  # PUT /space_checks/1.json
  def update
    @space_check = SpaceCheck.find(params[:id])

    respond_to do |format|
      if @space_check.update_attributes(params[:space_check])
        format.html { redirect_to @space_check, notice: 'Space check was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @space_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /space_checks/1
  # DELETE /space_checks/1.json
  def destroy
    internal_check = InternalCheck.find(params[:internal_check_id])
    @space_check = SpaceCheck.find(params[:id])
    @space_check.destroy

    respond_to do |format|
      format.html { redirect_to internal_check }
      format.json { head :no_content }
    end
  end
end
