class BackupEntriesController < ApplicationController
  # GET /backup_entries
  # GET /backup_entries.json
  def index
    @backup_entries = BackupEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @backup_entries }
    end
  end

  # GET /backup_entries/1
  # GET /backup_entries/1.json
  def show
    @backup_entry = BackupEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @backup_entry }
    end
  end

  # GET /backup_entries/new
  # GET /backup_entries/new.json
  def new
    @backup_entry = BackupEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @backup_entry }
    end
  end

  # GET /backup_entries/1/edit
  def edit
    @backup_entry = BackupEntry.find(params[:id])
  end

  # POST /backup_entries
  # POST /backup_entries.json
  def create
    @backup_entry = BackupEntry.new(params[:backup_entry])

    respond_to do |format|
      if @backup_entry.save
        format.html { redirect_to @backup_entry, notice: 'Backup entry was successfully created.' }
        format.json { render json: @backup_entry, status: :created, location: @backup_entry }
      else
        format.html { render action: "new" }
        format.json { render json: @backup_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /backup_entries/1
  # PUT /backup_entries/1.json
  def update
    @backup_entry = BackupEntry.find(params[:id])

    respond_to do |format|
      if @backup_entry.update_attributes(params[:backup_entry])
        format.html { redirect_to @backup_entry, notice: 'Backup entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @backup_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backup_entries/1
  # DELETE /backup_entries/1.json
  def destroy
    @backup_entry = BackupEntry.find(params[:id])
    @backup_entry.destroy

    respond_to do |format|
      format.html { redirect_to backup_entries_url }
      format.json { head :no_content }
    end
  end
end
