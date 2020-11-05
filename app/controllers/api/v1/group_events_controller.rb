class Api::V1::GroupEventsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def new
        # @group_event = GroupEvent.new
        @user = User.find_by(id: 1)
        @group_event = @user.group_events.new
        @address = @group_event.build_address

        render json: @address
    end

    def index
        @group_events = GroupEvent.all

        render json: @group_events
    end
    
    def create
        @user = User.find_by(id: 1)

        @group_event = @user.group_events.new(events_params)

        return render_errors('Failed to create Event!', :unprocessable_entity) unless @group_event.save
        
        render json: @group_event

    end

    def publish_event
        @group_event = GroupEvent.find_by(id: params[:event])

        render json: @group_event
    end

    def show
        @group_event = GroupEvent.find_by(id: params[:id])

        return render_errors('Event is not presetn with this id!', :unprocessable_entity) if @group_event.nil?

        render json: @group_event
    end

    def edit
        @group_event = GroupEvent.find_by(id: params[:id])

        return render_errors('Event is not presetn with this id!', :unprocessable_entity) if @group_event.nil?

        render json: @group_event
    end

    def update

        @group_event = GroupEvent.find(params[:id])
        @group_event.update_attributes! events_params

        return render_errors('Failed to update Event!', :unprocessable_entity) unless @group_event.update(events_params)
        render json: @group_event
    end

    def destroy
        @group_event = GroupEvent.find(params[:id])
        @group_event.destroy
      
        return render_errors('Failed to delete Event!', :unprocessable_entity) unless @group_event.destroy
        render json: @group_event
      end
    private
    def events_params
        params.require(:group_event)
        .permit(:name, :start_date, :duration, :description, address_attributes: [:country, :city, :state, :zip])
    end
end