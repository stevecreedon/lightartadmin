class QuickCostsController < ApplicationController
  # GET /quick_costs
  # GET /quick_costs.xml
  def index
    @quick_costs = QuickCost.all
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quick_costs }
    end
  end

  # GET /quick_costs/1
  # GET /quick_costs/1.xml
  def show
    @quick_cost = QuickCost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quick_cost }
    end
  end

  # GET /quick_costs/new
  # GET /quick_costs/new.xml
  def new
    @quick_cost = QuickCost.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @quick_cost }
    end
  end

  # GET /quick_costs/1/edit
  def edit
    @quick_cost = QuickCost.find(params[:id])
    def @cost.new_record?
      return false
    end
  end

  # POST /quick_costs
  # POST /quick_costs.xml
  def create
    
    r_params = resolve_params    
    @quick_cost = QuickCost.new(:name => r_params[:name])
    @quick_cost.cost.update_attributes(r_params[:cost])

    respond_to do |format|
      if @quick_cost.save
        format.html { redirect_to(@quick_cost, :notice => 'Duplicate cost was successfully created.') }
        format.xml  { render :xml => @quick_cost, :status => :created, :location => @quick_cost }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @quick_cost.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /quick_costs/1
  # PUT /quick_costs/1.xml
  def update
    r_params = resolve_params    
    @quick_cost = QuickCost.find(params[:id])
    @quick_cost.cost.update_attributes(r_params[:cost])

    respond_to do |format|
      if @quick_cost.save
        format.html { redirect_to(@quick_cost, :notice => 'Duplicate cost was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @quick_cost.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /quick_costs/1
  # DELETE /quick_costs/1.xml
  def destroy
    @quick_cost = QuickCost.find(params[:id])
    @quick_cost.destroy

    respond_to do |format|
      format.html { redirect_to(quick_costs_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def resolve_params
    name = params[:quick_cost].delete(:name)
    cost = params[:quick_cost].reject{|key, value| value == ""}   
    {:name => name, :cost => cost}  
  end
  
end
