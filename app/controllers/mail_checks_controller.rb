class MailChecksController < ApplicationController
  # GET /mail_checks
  # GET /mail_checks.json
  def index
    @mail_checks = MailCheck.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mail_checks }
    end
  end

  # GET /mail_checks/1
  # GET /mail_checks/1.json
  def show
    @mail_check = MailCheck.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mail_check }
    end
  end

  # GET /mail_checks/new
  # GET /mail_checks/new.json
  def new
    @mail_check = MailCheck.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mail_check }
    end
  end

  # GET /mail_checks/1/edit
  def edit
    @mail_check = MailCheck.find(params[:id])
  end

  # POST /mail_checks
  # POST /mail_checks.json
  def create
    @operations_check = OperationsCheck.find(params[:operations_check_id])
    @mail_check = MailCheck.new(mail_check_params)

    respond_to do |format|
      if @mail_check.save
        @operations_check.mail_check = @mail_check
        format.html { redirect_to operations_check_path(@operations_check, tab: 'mail'), 
          notice: 'Mail check was successfully created.' }
        format.json { render json: @mail_check, status: :created, location: @mail_check }
      else
        format.html { redirect_to operations_check_path(@operations_check, tab: 'mail'),
          notice: 'Commit failed - you must give a ticket number if the check failed!' }
        format.json { render json: @mail_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mail_checks/1
  # PATCH/PUT /mail_checks/1.json
  def update
    @mail_check = MailCheck.find(params[:id])

    respond_to do |format|
      if @mail_check.update_attributes(mail_check_params)
        format.html { redirect_to @mail_check, notice: 'Mail check was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mail_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mail_checks/1
  # DELETE /mail_checks/1.json
  def destroy
    operations_check = OperationsCheck.find(params[:operations_check_id])
    @mail_check = MailCheck.find(params[:id])
    @mail_check.destroy

    respond_to do |format|
      format.html { redirect_to operations_check_path(operations_check, tab: 'mail') }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def mail_check_params
      params.require(:mail_check).permit(:operations_check, :passed, :ticket)
    end
end
