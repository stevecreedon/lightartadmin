module CostsHelper
  
  def vats
    [[17.5,17.5],[12.5,12.5],[0.0,0.0]]
  end
  
  def users_options
    options_for_select([['All', nil]] + User.all.collect{|u| [u.email, u.id.to_s]}, params[:has_spent])
  end
  
  def in_the_last_options
    options_for_select([
      ["All","0"],
  		["this week","1"], 
  		["in the last 7 days","2"], 
  		["this month","3"], 
  		["the last 30 days","4"]
  	], params[:in_the_last])
  end
  
  def duplicate?
    params[:duplicate] == 'true'
  end
  
end
