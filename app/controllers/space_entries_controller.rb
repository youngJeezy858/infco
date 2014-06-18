class SpaceEntriesController < ApplicationController
  # GET /space_entries
  # GET /space_entries.json
  def index
    @space_entries = SpaceEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @space_entries }
    end
  end

  # GET /space_entries/1
  # GET /space_entries/1.json
  def show
    @space_entry = SpaceEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @space_entry }
    end
  end

  # GET /space_entries/new
  # GET /space_entries/new.json
  def new
    @space_entry = SpaceEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @space_entry }
    end
  end

  # GET /space_entries/1/edit
  def edit
    @space_entry = SpaceEntry.find(params[:id])
  end

  # POST /space_entries
  # POST /space_entries.json
  def create
    @space_entry = SpaceEntry.new(params[:space_entry])

    respond_to do |format|
      if @space_entry.save
        format.html { redirect_to @space_entry, notice: 'Space entry was successfully created.' }
        format.json { render json: @space_entry, status: :created, location: @space_entry }
      else
        format.html { render action: "new" }
        format.json { render json: @space_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /space_entries/1
  # PUT /space_entries/1.json
  def update
    @space_entry = SpaceEntry.find(params[:id])

    respond_to do |format|
      if @space_entry.update_attributes(params[:space_entry])
        format.html { redirect_to @space_entry, notice: 'Space entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @space_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /space_entries/1
  # DELETE /space_entries/1.json
  def destroy
    @space_entry = SpaceEntry.find(params[:id])
    @space_entry.destroy

    respond_to do |format|
      format.html { redirect_to space_entries_url }
      format.json { head :no_content }
    end
  end
end
