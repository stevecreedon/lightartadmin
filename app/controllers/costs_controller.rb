class CostsController < ApplicationController
  # GET /costs
  # GET /costs.xml
  def index
    
    sql = SqlBuilder.new
    sql.equals(:user_id => params[:has_spent], 
                :cost_centre_id => params[:cost_centre_id],
                :project_id => params[:project_id])
    sql.greater_than_or_equal(:payment_date => Date.from(params[:in_the_last].to_i))
    
    @costs = Cost.where(sql.to_a)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @costs }
    end
  end

  # GET /costs/1
  # GET /costs/1.xml
  def show
    @cost = Cost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cost }
    end
  end

  # GET /costs/new
  # GET /costs/new.xml
  def new
    @cost = Cost.new(:payment_date => Date.today, :user => current_user)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cost }
    end
  end

  # GET /costs/1/edit
  def edit
    @cost = Cost.find(params[:id])
    @cost.vat_inclusive = false
  end

  # POST /costs
  # POST /costs.xml
  def create
    @cost = Cost.new(params[:cost])

    respond_to do |format|
      if @cost.save
        format.html { redirect_to(costs_path, :notice => 'Cost was successfully created.') }
        format.xml  { render :xml => @cost, :status => :created, :location => @cost }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cost.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /costs/1
  # PUT /costs/1.xml
  def update
    @cost = Cost.find(params[:id])

    respond_to do |format|
      if @cost.update_attributes(params[:cost])
        format.html { redirect_to(costs_path, :notice => 'Cost was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cost.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /costs/1
  # DELETE /costs/1.xml
  def destroy
    @cost = Cost.find(params[:id])
    @cost.destroy

    respond_to do |format|
      format.html { redirect_to(costs_url) }
      format.xml  { head :ok }
    end
  end
  
 
  
end
