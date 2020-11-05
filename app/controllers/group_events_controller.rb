class GroupEventsController < ApplicationController
    before_action :set_group_event, except: %i[new create index]
    def new
        # @group_event = GroupEvent.new
        @user = User.find_by(id: 1)
        @group_event = @user.group_events.new
        @address = @group_event.build_address
    end
    def index
        @group_events = GroupEvent.all
    end
    
    def create
        @user = User.find_by(id: 1)

        @group_event = @user.group_events.new(events_params)

        @group_event.status = @group_event.event_publish_able? ? 1 : 0

            respond_to do |format|
            if @group_event.save
                format.html { redirect_to @group_event, notice: 'Group Event was successfully created.' }
                format.json { render action: 'show', status: :created, location: @group_event }
            else
                format.html { render action: 'new' }
                format.json { render json: @group_event.errors, status: :unprocessable_entity }
            end
        end
    end

    def publish_event
        if @group_event.event_publish_able? 
            @group_event.publish!
            redirect_to group_events_path
        else
            redirect_to edit_group_event_path(@group_event)
        end
    end

    def show
    end

    def edit
    end

    def update        
        @group_event.update_attributes! events_params
        redirect_to root_path
    end

    def destroy
        @group_event.destroy
      
        redirect_to group_events_path
    end

    private

    def set_group_event
        @group_event = GroupEvent.find(params[:id])
    end
    def events_params
        params.require(:group_event)
        .permit(:name, :start_date, :duration, :description, address_attributes: [:country, :city, :state, :street, :zip])
    end
        
end
