class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
  def index
    if params[:month] != nil && params[:month].to_i >= 1 && params[:month].to_i <= 12
        @month = params[:month].to_i
    else
        @month = Time.now.month
    end

    if params[:year] != nil && params[:year].to_i >= 1950 && params[:year].to_i <= 5000
        @year = params[:year].to_i
    else
        @year = Time.now.year
    end

    if params[:day] != nil
        @appointments = Appointment.by_day_month_and_year(current_user.id, params[:day], @month, @year).order(:hours, :minutes)
    else
        @start_day = Appointment.start_day_of_month(@month, @year)
        @number_of_days = Appointment.number_of_days_in_month(@month, @year)
        @this_day = Time.now.day
        @this_month = Time.now.month
        @this_year = Time.now.year
    end

  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
      params[:day] = @appointment.day
      params[:month] = @appointment.month
      params[:year] = @appointment.year
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user_id = current_user.id

    respond_to do |format|
      if @appointment.save
        day = @appointment.day
        month = @appointment.month
        year = @appointment.year
        format.html { redirect_to appointments_url(:day => day, :month => month, :year => year),
                    notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        day = @appointment.day
        month = @appointment.month
        year = @appointment.year
        format.html { redirect_to appointments_url(:day => day, :month => month, :year => year),
                      notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    day = @appointment.day
    month = @appointment.month
    year = @appointment.year

    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url(:day => day, :month => month, :year => year),
                    notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:content, :day, :month, :year, :hours, :minutes)
    end
end
