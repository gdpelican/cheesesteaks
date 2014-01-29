class DirectionsController < ContentController
  before_action :set_direction, only: [:show, :edit, :update, :destroy]
  before_action :set_collections, only: [:new, :edit, :update, :create]

  # GET /directions
  def index
    @directions = Direction.addresses.group_by(&:transit_mode)
  end

  # GET /directions/1
  def show
  end

  # GET /directions/new
  def new
    @direction = Direction.new
  end

  # GET /directions/1/edit
  def edit
  end

  # POST /directions
  def create
    @direction = Direction.new(strong_type params)

    if @direction.save!
      redirect_to @direction, notice: 'Direction was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /directions/1
  def update
    if @direction.update(strong_type params)
      redirect_to @direction, notice: 'Direction was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /directions/1
  def destroy
    @direction.destroy
    redirect_to directions_url, notice: 'Direction was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_direction
      @direction = Direction.find(params[:id])
    end

    def set_collections
      @origins = Address.origins || []
      @destinations = Address.destinations || []
      @transit_modes = TransitMode.all || []
    end
 
end