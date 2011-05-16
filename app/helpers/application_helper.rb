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
  
  def vat_inclusives
    [[nil,nil],['includes VAT',true],['plus VAT', false]]
  end
  
  def user_has_spent
    return User.find(params[:has_spent]).email unless params[:has_spent].blank?
    "Everyone"
  end
  
  def total_for_user(user_id)
    Cost.where("user_id = ? AND payment_date >= ?", 
                            params[:has_spent],
                            Date.from(params[:in_the_last].to_i)).sum(:amount)
  end
  
  def total_costs_by_cost_centre(cost_centre)
    Cost.where("cost_centre_id = ? AND user_id = ? AND payment_date >= ?", 
                            cost_centre.id, 
                            params[:has_spent],
                            Date.from(params[:in_the_last].to_i)).sum(:amount)
  end
  
  def total_costs_by_project(project)
    Cost.where("project_id = ? AND user_id = ? AND payment_date >= ?",
                            project.id,
                            params[:has_spent],
                            Date.from(params[:in_the_last].to_i)).sum(:amount)
  end
  
end
