module ApplicationHelper
  
  ACTION_LABELS = {"index" => {:label => 'view', :singular => false},
                  "show" => {:label => nil, :singular => true},
                  "new" => {:label => "create a new", :singular => true},
                  "create" => {:label => "create a new", :singular => true},
                  "edit" => {:label => 'edit this', :singular => true},
                  "update" => {:label => 'edit this', :singular => true}}
  
  def container
    return "grid-container" if params[:action] == "index" && params[:controller] == "costs"
    "container"
  end
  
  def page_title
    label = ACTION_LABELS[params[:action]]
    model = params[:controller].humanize.downcase
    model = model.singularize if label[:singular]
    "#{label[:label]} #{model}"
    
  end
  
  def f(name)
    return nil unless params[:f] && params[:f][name]
    params[:f][name]
  end
  
  def p(param)
    return nil unless params[:p] && params[:p][name]
    params[:p][name]
  end
  
  def vat_inclusives
    [[nil,nil],['includes VAT',true],['plus VAT', false]]
  end
  
  def user_has_spent
    return User.find(params[:has_spent]).email unless params[:has_spent].blank?
    "Everyone"
  end
  
  def total_for_user(user_id)
    sql = SqlBuilder.new
    sql.eq(:has_spent => params[:has_spent])
    sql.gt_or_eq(:in_the_last => Date.from(params[:in_the_last].to_i))
    
    Cost.where(sql.to_a).sum(:amount)
  end
  
  def total_costs_by_cost_centre(cost_centre)
    sql = SqlBuilder.new
    sql.eq(:user_id => params[:has_spent], :cc => cost_centre.id)
    sql.gt_or_eq(:payment_date => Date.from(params[:in_the_last].to_i))
    
    Cost.where(sql.to_a).sum(:amount)
  end
  
  def total_costs_by_project(project)
     sql = SqlBuilder.new
     sql.eq(:user_id => params[:has_spent], :pr => project.id)
     sql.gt_or_eq(:payment_date => Date.from(params[:in_the_last].to_i))

     Cost.where(sql.to_a).sum(:amount)
  end
  
  def growlify(obj)
     return obj if obj.is_a?(String)
     puts obj.join("</li><li>")
     return obj.join("</li><li>") if obj.is_a?(Array)
  end
  
end
