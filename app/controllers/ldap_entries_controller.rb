class LdapEntriesController < ApplicationController
  layout 'admin_tools'

  # GET /ldap_entries
  # GET /ldap_entries.json
  def index
    @ldap_entries = LdapEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ldap_entries }
    end
  end

  # GET /ldap_entries/1
  # GET /ldap_entries/1.json
  def show
    @ldap_entry = LdapEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ldap_entry }
    end
  end

  # GET /ldap_entries/new
  # GET /ldap_entries/new.json
  def new
    @ldap_entry = LdapEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ldap_entry }
    end
  end

  # GET /ldap_entries/1/edit
  def edit
    @ldap_entry = LdapEntry.find(params[:id])
  end

  # POST /ldap_entries
  # POST /ldap_entries.json
  def create
    @ldap_entry = LdapEntry.new(ldap_entry_params)

    respond_to do |format|
      if @ldap_entry.save
        format.html { redirect_to ldap_entries_path, notice: 'Ldap entry was successfully created.' }
        format.json { render json: @ldap_entry, status: :created, location: @ldap_entry }
      else
        format.html { render action: "new" }
        format.json { render json: @ldap_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ldap_entries/1
  # PATCH/PUT /ldap_entries/1.json
  def update
    @ldap_entry = LdapEntry.find(params[:id])

    respond_to do |format|
      if @ldap_entry.update_attributes(ldap_entry_params)
        format.html { redirect_to ldap_entries_path, notice: 'Ldap entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ldap_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ldap_entries/1
  # DELETE /ldap_entries/1.json
  def destroy
    @ldap_entry = LdapEntry.find(params[:id])
    @ldap_entry.destroy

    respond_to do |format|
      format.html { redirect_to ldap_entries_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def ldap_entry_params
      params.require(:ldap_entry).permit(:name)
    end
end
