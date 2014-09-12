class PrinterChecksController < ApplicationController
  # GET /printer_checks
  # GET /printer_checks.json
  def index
    @printer_checks = PrinterCheck.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @printer_checks }
    end
  end

  # GET /printer_checks/1
  # GET /printer_checks/1.json
  def show
    @printer_check = PrinterCheck.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @printer_check }
    end
  end

  # GET /printer_checks/new
  # GET /printer_checks/new.json
  def new
    @printer_check = PrinterCheck.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @printer_check }
    end
  end

  # GET /printer_checks/1/edit
  def edit
    @printer_check = PrinterCheck.find(params[:id])
  end

  # POST /printer_checks
  # POST /printer_checks.json
  def create
    @operations_check = OperationsCheck.find(params[:operations_check_id])
    @printer_check = @operations_check.printer_checks.create(printer_check_params)

    respond_to do |format|
      if @printer_check.save
        format.html { redirect_to operations_check_path(@operations_check.id, tab:"printers"), 
          notice: 'Printer check was successfully created.' }
        format.json { render json: @printer_check, status: :created, location: @printer_check }
      else
        format.html { redirect_to operations_check_path(@operations_check.id, tab:"printers"), 
          notice: 'Commit Failed - You need to give a ticket number if the check failed!' }
        format.json { render json: @printer_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /printer_checks/1
  # PATCH/PUT /printer_checks/1.json
  def update
    @operations_check = OperationsCheck.find(params[:operations_check_id])
    @printer_check = @operations_check.printer_checks.find(params[:id])

    respond_to do |format|
      if @printer_check.update_attributes(printer_check_params)
        format.html { redirect_to @printer_check, notice: 'Printer check was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @printer_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /printer_checks/1
  # DELETE /printer_checks/1.json
  def destroy
    operations_check = OperationsCheck.find(params[:operations_check_id])
    @printer_check = PrinterCheck.find(params[:id])
    @printer_check.destroy

    respond_to do |format|
      format.html { redirect_to operations_check_path(operations_check.id, tab:"printers") }
      format.json { head :no_content }
    end
  end

  def mass_create
    @operations_check = OperationsCheck.find(params[:operations_check_id])
    params[:printer_checks].each do |i, values|
      @printer_check = @operations_check.printer_checks.create(values)
      unless @printer_check.save
        redirect_to operations_check_path(@operations_check.id, tab:"printers"),
          notice: 'Commit Failed - You need to give a ticket number if the check failed!' 
        return
      end
    end
    redirect_to operations_check_path(@operations_check.id, tab:"printers"),
       notice: 'Printer checks were successfully created.' 
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def printer_check_params
      params.require(:printer_check).permit(:name, :ticket, :passed)
    end
end
