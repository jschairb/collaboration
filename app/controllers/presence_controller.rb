class PresenceController < ApplicationController
  # GET /presence
  # GET /presence.xml
  def index
    @presence = Presence.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @presence }
    end
  end

  # GET /presence/1
  # GET /presence/1.xml
  def show
    @presence = Presence.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @presence }
    end
  end

  # GET /presence/new
  # GET /presence/new.xml
  def new
    @presence = Presence.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @presence }
    end
  end

  # GET /presence/1/edit
  def edit
    @presence = Presence.find(params[:id])
  end

  # POST /presence
  # POST /presence.xml
  def create
    @presence = Presence.new(params[:presence])

    respond_to do |format|
      if @presence.save
        flash[:notice] = 'Presence was successfully created.'
        format.html { redirect_to(@presence) }
        format.xml  { render :xml => @presence, :status => :created, :location => @presence }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @presence.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /presence/1
  # PUT /presence/1.xml
  def update
    @presence = Presence.find(params[:id])

    respond_to do |format|
      if @presence.update_attributes(params[:presence])
        flash[:notice] = 'Presence was successfully updated.'
        format.html { redirect_to(@presence) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @presence.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /presence/1
  # DELETE /presence/1.xml
  def destroy
    @presence = Presence.find(params[:id])
    @presence.destroy

    respond_to do |format|
      format.html { redirect_to(presence_url) }
      format.xml  { head :ok }
    end
  end
end
