module CostsHelper
  
  def vats
    [[17.5,17.5],[12.5,12.5],[0.0,0.0]]
  end
  
  def users_options
    options_for_select([['All', nil]] + User.all.collect{|u| [u.email, u.id.to_s]})
  end
  
  def in_the_last_options
    options_for_select([
  		["this week","0"], 
  		["in the last 7 days","1"], 
  		["this month","2"], 
  		["the last 30 days","3"]
  	])
  end
  
end
