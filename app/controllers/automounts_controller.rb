class AutomountsController < ApplicationController
  layout 'admin_tools'

  # GET /automounts
  # GET /automounts.json
  def index
    @automounts = Automount.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @automounts }
    end
  end

  # GET /automounts/1
  # GET /automounts/1.json
  def show
    @automount = Automount.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @automount }
    end
  end

  # GET /automounts/new
  # GET /automounts/new.json
  def new
    @automount = Automount.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @automount }
    end
  end

  # GET /automounts/1/edit
  def edit
    @automount = Automount.find(params[:id])
  end

  # POST /automounts
  # POST /automounts.json
  def create
    @automount = Automount.new(automount_params)

    respond_to do |format|
      if @automount.save
        format.html { redirect_to automounts_path, notice: 'Automount was successfully created.' }
        format.json { render json: @automount, status: :created, location: @automount }
      else
        format.html { render action: "new" }
        format.json { render json: @automount.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /automounts/1
  # PATCH/PUT /automounts/1.json
  def update
    @automount = Automount.find(params[:id])

    respond_to do |format|
      if @automount.update_attributes(automount_params)
        format.html { redirect_to automounts_path, notice: 'Automount was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @automount.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /automounts/1
  # DELETE /automounts/1.json
  def destroy
    @automount = Automount.find(params[:id])
    @automount.destroy

    respond_to do |format|
      format.html { redirect_to automounts_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def automount_params
      params.require(:automount).permit(:name)
    end
end
