class ActivitiesController < ApplicationController
  before_filter :authenticate_user!, only: [:do_it]
  before_filter :authenticate_admin!, except: [:do_it]

  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activities }
    end
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
    @activity = Activity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /activities/new
  # GET /activities/new.json
  def new
    @activity = Activity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /activities/1/edit
  def edit
    @activity = Activity.find(params[:id])
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(params[:activity])

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
        format.json { render json: @activity, status: :created, location: @activity }
      else
        format.html { render action: "new" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activities/1
  # PUT /activities/1.json
  def update
    @activity = Activity.find(params[:id])

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render activity: "edit" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to activities_url }
      format.json { head :no_content }
    end
  end

  def do_it
    @activity = Activity.find(params[:id])
    @event = Event.find(params[:event])

    case @activity.activity_type
    when "link"
      # проверяем на дубликаты
      unless Transaction.where(user_id: current_user.id, activity_id: @activity.id, event_id: @event.id).first
        t = Transaction.create(
          user_id: current_user.id,
          activity_id: @activity.id,
          event_id: @event.id,
          minutes: @activity.minutes,
          money: @activity.money,
          status: (@activity.instantly? ? 'done' : 'pending'))


        current_user.minutes += @activity.minutes
        current_user.save

        if @activity.instantly?
          @event.current_money += @activity.money
          @event.current_min += @activity.minutes
          @event.save!
        end
      end

      redirect_to @activity.data
    end
  end

  def resolve_pending
    @activity = Activity.find(params[:id])
    money = params[:resolve][:money].to_f

    @activity.resolve_pending(money)
    redirect_to :back, notice: 'Pending transactions resolved'
  end
end
