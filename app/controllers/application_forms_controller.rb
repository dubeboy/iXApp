class ApplicationFormsController < ApplicationController
  before_action :authenticate_student!
  before_action :get_varsities, only: [:new, :edit]
  before_action :set_application_form, only: [:show, :edit, :update, :destroy]

  def index
    @application_forms = ApplicationForm.all
  end

  # GET /application_forms/1
  # GET /application_forms/1.json
  def show
    @application_form = current_student.application_form

    if @application_form.nil?
      redirect_to new_student_application_forms_path
    end

  end

  # GET /application_forms/new
  def new
    @application_form = ApplicationForm.new
  end

  # GET /application_forms/1/edit
  def edit
  end

  # POST /application_forms
  # POST /application_forms.json
  def create
    @application_form = ApplicationForm.new(address: params[:address],
                                            varsity_id: params[:varsity_id],
                                            graduation_year: params[:graduation_year],
                                            student_id: params[:student_id])

    if @application_form.save
      redirect_to root_path, notice: 'Application form was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /application_forms/1
  # PATCH/PUT /application_forms/1.json
  def update
    respond_to do |format|
      if @application_form.update(application_form_params)
        format.html {redirect_to @application_form, notice: 'Application form was successfully updated.'}
        format.json {render :show, status: :ok, location: @application_form}
      else
        format.html {render :edit}
        format.json {render json: @application_form.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /application_forms/1
  # DELETE /application_forms/1.json
  def destroy
    @application_form.destroy
    respond_to do |format|
      format.html {redirect_to application_forms_url, notice: 'Application form was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_application_form
    @application_form = current_student.application_form
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def application_form_params
    puts "----------------------------"
    puts params
    puts "----------------------------"
    params.require(:application_form).permit(:address, :varsity_id, :graduation_year, :student_id)
  end

  def get_varsities
    @varsities = Varsity.all
  end
end
