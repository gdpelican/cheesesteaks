module WorkshopChild
   
  def find(id)
    child = super(id)
    child.workshop = WorkshopDecorator.new child.workshop
    child
  end  
 
  def verify_workshop
    child = instance_variable_set(instance, model.find(params[:id]))
    if params[:workshop_id]
      workshop = Workshop.find_by_year(params[:workshop_id]) rescue nil
      redirect_to action: action_name, workshop_id: nil unless child.in_workshop(workshop)
    end
  end 
  
  private
  
  def instance
    "@#{controller_name.classify.underscore}"
  end
 
  def model
    controller_name.classify.constantize
  end 

end
