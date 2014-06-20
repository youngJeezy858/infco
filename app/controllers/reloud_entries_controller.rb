class ReloudEntriesController < ApplicationController
  # GET /reloud_entries
  # GET /reloud_entries.json
  def index
    @reloud_entries = ReloudEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reloud_entries }
    end
  end

  # GET /reloud_entries/1
  # GET /reloud_entries/1.json
  def show
    @reloud_entry = ReloudEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reloud_entry }
    end
  end

  # GET /reloud_entries/new
  # GET /reloud_entries/new.json
  def new
    @reloud_entry = ReloudEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reloud_entry }
    end
  end

  # GET /reloud_entries/1/edit
  def edit
    @reloud_entry = ReloudEntry.find(params[:id])
  end

  # POST /reloud_entries
  # POST /reloud_entries.json
  def create
    @reloud_entry = ReloudEntry.new(reloud_entry_params)

    respond_to do |format|
      if @reloud_entry.save
        format.html { redirect_to reloud_entries_path, notice: 'Reloud entry was successfully created.' }
        format.json { render json: @reloud_entry, status: :created, location: @reloud_entry }
      else
        format.html { render action: "new" }
        format.json { render json: @reloud_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reloud_entries/1
  # PATCH/PUT /reloud_entries/1.json
  def update
    @reloud_entry = ReloudEntry.find(params[:id])

    respond_to do |format|
      if @reloud_entry.update_attributes(reloud_entry_params)
        format.html { redirect_to reloud_entries_path, notice: 'Reloud entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reloud_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reloud_entries/1
  # DELETE /reloud_entries/1.json
  def destroy
    @reloud_entry = ReloudEntry.find(params[:id])
    @reloud_entry.destroy

    respond_to do |format|
      format.html { redirect_to reloud_entries_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def reloud_entry_params
      params.require(:reloud_entry).permit(:name)
    end
end
