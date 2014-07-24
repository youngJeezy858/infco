class InternalChecksController < ApplicationController
  # GET /internal_checks
  # GET /internal_checks.json
  def index
    @internal_checks = InternalCheck.search(params[:search])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @internal_checks }
    end
  end

  # GET /internal_checks/1
  # GET /internal_checks/1.json
  def show
    @internal_check = InternalCheck.find(params[:id])
    @backup_entries = BackupEntry.all
    @space_entries = SpaceEntry.all
  
    if @internal_check.backup_checks.all.count +
        @internal_check.space_checks.all.count == 0
      @internal_check.passed = "true"
    else
      @internal_check.passed = "false"
    end
    @internal_check.save

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @internal_check }
    end
  end

  # GET /internal_checks/new
  # GET /internal_checks/new.json
  def new
    @internal_check = InternalCheck.new
    @internal_check.date = Date.today
    @internal_check.passed = true
#    @internal_check.owner = current_user.login
    @internal_check.owner = "kfrank"
    @internal_check.save
    redirect_to @internal_check, notice: 'Internal check was successfully created.' 
  end

  # GET /internal_checks/1/edit
  def edit
    @internal_check = InternalCheck.find(params[:id])
  end

  # POST /internal_checks
  # POST /internal_checks.json
  def create
    @internal_check = InternalCheck.new
    @internal_check.date = Time.now
    @internal_check.owner = "kfrank"
    
    @internal_check.save
    redirect_to @internal_check, notice: 'Internal check was successfully created.' 
      
  end

  # PUT /internal_checks/1
  # PUT /internal_checks/1.json
  def update
    @internal_check = InternalCheck.find(params[:id])

    respond_to do |format|
      if @internal_check.update_attributes(params[:internal_check])
        format.html { redirect_to @internal_check, notice: 'Internal check was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @internal_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /internal_checks/1
  # DELETE /internal_checks/1.json
  def destroy
    @internal_check = InternalCheck.find(params[:id])
    @internal_check.backup_checks.each do |backup_check|
      backup_check.destroy
    end
    @internal_check.space_checks.each do |space_check|
      space_check.destroy
    end
    @internal_check.destroy

    respond_to do |format|
      format.html { redirect_to internal_checks_url }
      format.json { head :no_content }
    end
  end

  def sign_off
    @internal_check = InternalCheck.find(params[:id])
#    if @internal_check.owner == current_user.login
    if @internal_check.owner == "doesn't matter"
#    @internal_check.signed_off_by = current_user.login
      redirect_to @internal_check, notice: "Sign off failed! - cannot sign off on your own check!!!"
    else
      @internal_check.signed_off_by = "bmartin4"
      @internal_check.save
      redirect_to @internal_check, notice: "#{@internal_check.signed_off_by} has confirmed this check was completed"
    end
  end

end
