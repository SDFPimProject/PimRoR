class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.by_user_id_no_deleted(current_user.id)
  end

  # GET /events/1
  # GET /events/1.json
  def show
      @event = Event.find(params[:id])

      @is_show_mode = !(@event.creator_id == current_user.id);
      @is_deleted = @event.deleted != 0

      if (@is_show_mode)
          @invites = Invite.by_recipient_id_and_event_id(current_user.id, @event.id)
          @invite = @invites.first()
          if (@invite == nil)
              respond_to do |format|
                format.html { redirect_to events_url, notice: 'Sie sind nicht berechtigt diesen Event anzuschauen!' }
                format.json { head :no_content }
              end
          end
      else
          @invites = Invite.by_sender_id_and_event_id(current_user.id, @event.id)
      end

  end

  # GET /events/new
  def new
    @is_show_mode = false;
    @event = Event.new
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.creator_id = current_user.id
    @event.deleted = 0
    saved = @event.save

    respond_to do |format|
      if saved
        @invited_persons_array = params[:invited_persons].split(";");
        if @invited_persons_array.size() > 0
            @invited_persons_array.each do |person_id|
                if (person_id != current_user.id) && (Invite.by_recipient_id_and_event_id(person_id, @event.id).first() == nil)
                    @invite = Invite.new()
                    @invite.event_id = @event.id;
                    @invite.sender_id = current_user.id;
                    @invite.recipient_id = person_id;
                    @invite.sender_comment = "";
                    @invite.recipient_comment = "";
                    @invite.sender_status = 0;
                    @invite.recipient_status = 0;
                    @invite.save();
                end
            end
        end

        format.html { redirect_to @event, notice: 'Event was successfully created.'}
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    if (!params[:recipient_comment])
        respond_to do |format|
          if @event.update(event_params)

              @invited_persons_array = params[:invited_persons].split(";");
              if @invited_persons_array.size() > 0
                  @invited_persons_array.each do |person_id|
                      if (person_id != current_user.id) && (Invite.by_recipient_id_and_event_id(person_id, @event.id).first() == nil)
                          @invite = Invite.new()
                          @invite.event_id = @event.id;
                          @invite.sender_id = current_user.id;
                          @invite.recipient_id = person_id;
                          @invite.sender_comment = "";
                          @invite.recipient_comment = "";
                          @invite.sender_status = 0;
                          @invite.recipient_status = 0;
                          @invite.save();
                      end
                  end
              end

            format.html { redirect_to @event, notice: 'Event was successfully updated.' }
            format.json { render :show, status: :ok, location: @event }
          else
            format.html { render :edit }
            format.json { render json: @event.errors, status: :unprocessable_entity }
          end
        end
    else
        @invites = Invite.by_recipient_id_and_event_id(current_user.id, @event.id)
        @invite = @invites.first()
        if (@invite != nil)
            @invite.recipient_comment = params[:recipient_comment]
            @invite.recipient_status = params[:recipient_status]
            @invite.save();
        end

        respond_to do |format|
            format.html { redirect_to @event, notice: 'Ihr Kommentar wurde gepseichert'}
            format.json { render :show, status: :ok, location: @event }
        end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.deleted = 1
    @event.save();
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :start_time, :end_time, :location)
    end
end
