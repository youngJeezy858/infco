class BackupChecksController < ApplicationController
  # GET /backup_checks
  # GET /backup_checks.json
  def index
    @backup_checks = BackupCheck.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @backup_checks }
    end
  end

  # GET /backup_checks/1
  # GET /backup_checks/1.json
  def show
    @backup_check = BackupCheck.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @backup_check }
    end
  end

  # GET /backup_checks/new
  # GET /backup_checks/new.json
  def new
    @backup_check = BackupCheck.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @backup_check }
    end
  end

  # GET /backup_checks/1/edit
  def edit
    @backup_check = BackupCheck.find(params[:id])
  end

  # POST /backup_checks
  # POST /backup_checks.json
  def create
    @internal_check = InternalCheck.find(params[:internal_check_id])
    @backup_check = @internal_check.backup_checks.create(params[:backup_check])

    unless @backup_check.name.present?
      @backup_check.destroy
      redirect_to @internal_check,
      notice: 'Please provide the name of the instance you are reporting.'
      return
    end

    respond_to do |format|
      if @backup_check.save
        format.html { redirect_to @internal_check, notice: 'Backup failure successfully reported.' }
        format.json { render json: @backup_check, status: :created, location: @backup_check }
      else
        format.html { render action: "new" }
        format.json { render json: @backup_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /backup_checks/1
  # PUT /backup_checks/1.json
  def update
    @backup_check = BackupCheck.find(params[:id])

    respond_to do |format|
      if @backup_check.update_attributes(params[:backup_check])
        format.html { redirect_to @backup_check, notice: 'Backup check was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @backup_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backup_checks/1
  # DELETE /backup_checks/1.json
  def destroy
    @backup_check = BackupCheck.find(params[:id])
    internal_check = InternalCheck.find(params[:internal_check_id])
    @backup_check.destroy

    respond_to do |format|
      format.html { redirect_to internal_check }
      format.json { head :no_content }
    end
  end

end
