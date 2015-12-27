class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy]

  # GET /participants
  # GET /participants.json
  def index
    @participants = Participant.all
  end

  # GET /participants/1
  # GET /participants/1.json
  def show
  end

  # GET /participants/new
  def new
    @participant = Participant.new
  end

  # GET /participants/1/edit
  def edit
  end

  # POST /participants
  # POST /participants.json
  def create
      @participant = Participant.new(participant_params)
      if @participant.save
          redirect_to event_path(@participant[:event_id]), notice: 'Participant was successfully created.'
      else
      render action: new
      end
  end

  # PATCH/PUT /participants/1
  # PATCH/PUT /participants/1.json
  def update
      if @participant.update(participant_params)
        redirect_to event_path(@participant[:event_id]), notice: 'Participant was successfully updated.'
      else
        render action: 'edit'
      end
  end

  # DELETE /participants/1
  # DELETE /participants/1.json
  def destroy
    id = params[:id]
    #event = Participant.find(params[:id])[:event_id]
    @participant.destroy
    #redirect_to event_path(:id => event), notice: 'You canceled join this event.'
    render :json => {:delete_participant => id}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participant_params
        params.require(:participant).permit(:name, :grade, :comment, :event_id)
    end
end
