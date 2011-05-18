class CostCentresController < ApplicationController
  # GET /cost_centres
  # GET /cost_centres.xml
  def index
    @cost_centres = CostCentre.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cost_centres }
    end
  end

  # GET /cost_centres/1
  # GET /cost_centres/1.xml
  def show
    @cost_centre = CostCentre.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cost_centre }
    end
  end

  # GET /cost_centres/new
  # GET /cost_centres/new.xml
  def new
    @cost_centre = CostCentre.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cost_centre }
    end
  end

  # GET /cost_centres/1/edit
  def edit
    @cost_centre = CostCentre.find(params[:id])
  end

  # POST /cost_centres
  # POST /cost_centres.xml
  def create
    @cost_centre = CostCentre.new(params[:cost_centre])

    respond_to do |format|
      if @cost_centre.save
        format.html { redirect_to(@cost_centre, :notice => 'Cost centre was successfully created.') }
        format.xml  { render :xml => @cost_centre, :status => :created, :location => @cost_centre }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cost_centre.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cost_centres/1
  # PUT /cost_centres/1.xml
  def update
    @cost_centre = CostCentre.find(params[:id])

    respond_to do |format|
      if @cost_centre.update_attributes(params[:cost_centre])
        format.html { redirect_to(@cost_centre, :notice => 'Cost centre was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cost_centre.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cost_centres/1
  # DELETE /cost_centres/1.xml
  def destroy
    @cost_centre = CostCentre.find(params[:id])
    notice = @cost_centre.destroy ? "Cost Centre destroyed" : "Unable to destroy Cost Centre as it has existing costs"

    respond_to do |format|
      format.html { redirect_to(cost_centres_url, :notice => notice) }
      format.xml  { head :ok }
    end
  end
end
