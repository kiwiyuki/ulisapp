class Admin::EventsController < Admin::AdminController
    before_action :set_event, only: [:show, :edit, :update, :destroy, :new_participant, :start, :fin, :only_name_and_grade]
    
    # GET admin/events
    # GET admin/events.json
    def index
        @events = Event.all.order('event_date desc')
    end
    
    # GET admin/events/1
    # GET admin/events/1.json
    def show
    end
    
    # GET admin/events/new
    def new
        @event = Event.new
    end
    
    # GET admin/events/1/edit
    def edit
    end
    
    # POST admin/events
    # POST admin/events.json
    def create
        @event = Event.new(event_params)
        if @event.save
            redirect_to admin_event_path(@event), notice: 'イベントが作成されました。'
        else
            render action: 'new'
        end
    end
    
    # PATCH/PUT admin/events/1
    # PATCH/PUT admin/events/1.json
    def update
        if @event.update(event_params)
            redirect_to admin_event_path(@event), notice: 'イベントの編集が完了しました。'
        else
            render action: 'edit'
        end
    end
    
    # DELETE admin/events/1
    # DELETE admin/events/1.json
    def destroy
        @event.destroy
        redirect_to admin_events_url
        #id = params[:id]
        #@event.destroy
        #render :json => {:delete_event => id}
    end
    
    # 新規参加者
    def new_participant
        @participant = Participant.new
        @participant[:event_id] = @event.id
    end
    
    # イベント参加者の受付を開始する
    def start
        @event.update(:reception => 'true')
        redirect_to admin_event_path(@event)
    end
    
    # イベント参加者の受付を終了する
    def fin
        @event.update(:reception => 'false')
        redirect_to admin_event_path(@event)
    end
    
    # 名前、学年のみを表示
    def only_name_and_grade
    end
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
        @event = Event.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
        params.require(:event).permit(:event_name, :event_date, :summary, :reception)
    end
end
