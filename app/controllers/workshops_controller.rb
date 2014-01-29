class WorkshopsController < ContentController
  
  layout 'content'
  
  before_filter :set_workshops, only: [:index]
  before_filter :set_workshop, except: [:index, :create]
  before_filter :set_collections, only: [:edit]
  
  # GET /workshops
  # GET /workshops.json
  def index
    @workshops = Workshop.past

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workshops }
    end
  end

  # GET /workshops/1
  # GET /workshops/1.json
  def show    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @workshop }
    end
  end
  
  # GET /workshops/1/edit
  def edit
  end

  def create
    @workshop = Workshop.create! year: params[:year]
    respond_to do |format|
      format.html { redirect_to edit_workshop_path(@workshop) }
    end
  end

  # PUT /workshops/1
  # PUT /workshops/1.json
  def update
    populate_flash @workshop.update_attributes(strong_type params)
    respond_to do |format|
      format.html { redirect_to edit_workshop_path(@workshop.year) + '/' + params[:fieldset] }
    end
  end
  
  def destroy
    populate_flash @workshop.destroy
    respond_to do |format|
      format.html { redirect_to workshops_path }
    end
  end
  
  private
    
  def set_workshop
    @workshop = WorkshopDecorator.new Workshop.find_by_year(params[:id])
  end
  
  def set_collections
    @use_maps = true
    @unused_teachers = Teacher.not_in_workshop(@workshop)
    @addresses = Address.destinations
  end
end