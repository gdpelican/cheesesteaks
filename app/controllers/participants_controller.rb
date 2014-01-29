class ParticipantsController < ContentController
  before_action :set_participant, only: [:show, :edit, :update, :destroy]
  before_action :new_participant, only: [:new, :create]
  before_action :require_auth, only: [:show, :edit, :update, :index]

  # GET /participants
  def index
    @workshop = Workshop.find_by_year(params[:workshop_id]).decorate
    @participants = ParticipantDecorator.build_collection @workshop.participants
  end

  # GET /participants/1
  def show
  end

  # GET /participants/new
  def new
  end

  # GET /participants/1/edit
  def edit
  end

  # POST /participants
  def create
    if @participant.save
      redirect_to @participant, notice: 'Participant was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /participants/1
  def update
    if @participant.update(strong_type params)
      redirect_to @participant, notice: 'Participant was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /participants/1
  def destroy
    @participant.destroy
    redirect_to participants_url, notice: 'Participant was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id]).decorate
    end
    
    def new_participant
      p = params[:participant] ? Participant.new(strong_type params) : Participant.new
      @participant = p.decorate
    end
end