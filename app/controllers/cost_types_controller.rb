class CostTypesController < ApplicationController
  # GET /cost_types
  # GET /cost_types.xml
  def index
    @cost_types = CostType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cost_types }
    end
  end

  # GET /cost_types/1
  # GET /cost_types/1.xml
  def show
    @cost_type = CostType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cost_type }
    end
  end

  # GET /cost_types/new
  # GET /cost_types/new.xml
  def new
    @cost_type = CostType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cost_type }
    end
  end

  # GET /cost_types/1/edit
  def edit
    @cost_type = CostType.find(params[:id])
  end

  # POST /cost_types
  # POST /cost_types.xml
  def create
    @cost_type = CostType.new(params[:cost_type])

    respond_to do |format|
      if @cost_type.save
        format.html { redirect_to(@cost_type, :notice => 'Cost type was successfully created.') }
        format.xml  { render :xml => @cost_type, :status => :created, :location => @cost_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cost_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cost_types/1
  # PUT /cost_types/1.xml
  def update
    @cost_type = CostType.find(params[:id])

    respond_to do |format|
      if @cost_type.update_attributes(params[:cost_type])
        format.html { redirect_to(@cost_type, :notice => 'Cost type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cost_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cost_types/1
  # DELETE /cost_types/1.xml
  def destroy
    @cost_type = CostType.find(params[:id])
    @cost_type.destroy

    respond_to do |format|
      format.html { redirect_to(cost_types_url) }
      format.xml  { head :ok }
    end
  end
end
