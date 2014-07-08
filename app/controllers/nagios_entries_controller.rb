class NagiosEntriesController < ApplicationController
  layout 'admin_tools'

  # GET /nagios_entries
  # GET /nagios_entries.json
  def index
    @nagios_entries = NagiosEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nagios_entries }
    end
  end

  # GET /nagios_entries/1
  # GET /nagios_entries/1.json
  def show
    @nagios_entry = NagiosEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @nagios_entry }
    end
  end

  # GET /nagios_entries/new
  # GET /nagios_entries/new.json
  def new
    @nagios_entry = NagiosEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @nagios_entry }
    end
  end

  # GET /nagios_entries/1/edit
  def edit
    @nagios_entry = NagiosEntry.find(params[:id])
  end

  # POST /nagios_entries
  # POST /nagios_entries.json
  def create
    @nagios_entry = NagiosEntry.new(nagios_entry_params)

    respond_to do |format|
      if @nagios_entry.save
        format.html { redirect_to nagios_entries_path, notice: 'Nagios entry was successfully created.' }
        format.json { render json: @nagios_entry, status: :created, location: @nagios_entry }
      else
        format.html { render action: "new" }
        format.json { render json: @nagios_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nagios_entries/1
  # PATCH/PUT /nagios_entries/1.json
  def update
    @nagios_entry = NagiosEntry.find(params[:id])

    respond_to do |format|
      if @nagios_entry.update_attributes(nagios_entry_params)
        format.html { redirect_to nagios_entries_path, notice: 'Nagios entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @nagios_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nagios_entries/1
  # DELETE /nagios_entries/1.json
  def destroy
    @nagios_entry = NagiosEntry.find(params[:id])
    @nagios_entry.destroy

    respond_to do |format|
      format.html { redirect_to nagios_entries_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def nagios_entry_params
      params.require(:nagios_entry).permit(:name)
    end
end
