class EventsController < ApplicationController
  # respond_to :json


  def index

    todolist = Todolist.using(:shard_one)
    # @username=[]
    if params[:user_id]=='all'
      # @username = 'всех'

      # flash[:alert]=params[:user_id]
      @todolists = todolist.where(private: false)
    elsif params[:user_id].present?
      # @username = User.find(params[:user_id]).username
      # flash[:alert]=params[:user_id]
      if current_user.present? && current_user.id == params[:user_id].to_i
        @todolists = todolist.where(performer_id: params[:user_id])
      else
        @todolists = todolist.where("private = ? and performer_id = ?", false, params[:user_id])
      end
    elsif params[:user_id].blank?
      if current_user.present? && User.find_by_username('admin').id
        @todolists = todolist.where(performer_id: User.find_by_username('admin').id)
      else
        @todolists = todolist.where("private = ? and performer_id = ?", false, User.find_by_username('admin').id)
      end

    end

    @events = Event.using(:shard_one).where(todolist_id: @todolists.select(:id))


    respond_to do |format|
      format.html
      format.json { render json: @events }
    end

  end


  # GET /events/1
  # GET /events/1.json
  def show

    @event = Event.using(:shard_one).find(params[:id])
    @todolist = Todolist.using(:shard_one).where("id =  ?", @event.todolist_id).first
    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render :json => @event }
    # end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.using(:shard_one).new

  end

  # GET /events/1/edit
  def edit
    @event = Event.using(:shard_one).find(params[:id])
    render json: @event
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.using(:shard_one).new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end

  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.using(:shard_one).find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, :notice => 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end



  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.using(:shard_one).find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  private
  def event_params
    params.require(:event).permit!
  end

  # def todolist_params
  #   params.require(:todolist).permit(:title, :description, :user_id, :performer_id, :private, :event_id)
  # end

end
