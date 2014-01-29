class SessionsController < ContentController

  # GET /sessions/new
  def new
    @session = Session.new
  end

  # POST /sessions
  def create
    @session = Session.new(strong_type(params))

    if @session.save
      session[:id] = @session.id
      redirect_to root_url, notice: 'Successfully logged in as admin.'
    else
      redirect_to '/login', error: 'Invalid admin password'
    end
  end

  # DELETE /sessions/1
  def destroy
    session[:id] = nil
    redirect_to root_url, notice: 'Successfully logged out.'
  end
   
end