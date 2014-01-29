class ApplicationController < ActionController::Base
  protect_from_forgery
    
  before_filter :authed
    
  def initialize
    raise ActionController::ActionControllerError.new('No workshop active') if Workshop.current.nil?
    
    @current = WorkshopDecorator.new Workshop.current    
    @links = Link.clean_for_year @current.year
    super
  end
  
  def populate_flash(success)
    if success then flash[:notice] = "#{controller_name.classify} was successfully #{action_name}d"
    else            flash[:error]  = "#{controller_name.classify} was unabled to be #{action_name}d; please try again" 
    end
  end
  
  def require_auth
    redirect_to '/login', notice: 'Please log in to view this page' unless @authed
  end
  
  def authed
    @authed = session[:id]
  end
  
  def strong_type(params)
    params.require(controller_name.classify.underscore.to_sym).permit(controller_name.classify.constantize.mass_fields)
  end
 
end
