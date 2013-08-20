class SurveyResultsController < ApplicationController
  layout 'survey'
  before_filter :authorize_survey_user
  before_action :set_survey_result, only: [:show, :edit, :update, :destroy]
  # before_action :set_user

  # GET /survey_results
  # GET /survey_results.json
  def index
    @survey_results = SurveyResult.where({survey_user_id: survey_user.id})
  end

  # GET /survey_results/1
  # GET /survey_results/1.json
  def show
  end

  # GET /survey_results/new
  def new
    @survey_result = SurveyResult.new
  end

  # GET /survey_results/1/edit
  def edit
  end

  # POST /survey_results
  # POST /survey_results.json
  def create
    #@survey_result = SurveyResult.new(survey_result_params)
    @survey_result = SurveyResult.new(params[:survey_result])
    @survey_result.survey_user_id = survey_user.id
    @survey_result.survey_id = 1

    respond_to do |format|
      if @survey_result.save
        format.html { redirect_to user_survey_results_url, notice: 'Survey result was successfully created.' }
        format.json { render action: 'show', status: :created, location: @survey_result }
      else
        format.html { render action: 'new' }
        format.json { render json: @survey_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey_results/1
  # PATCH/PUT /survey_results/1.json
  def update
    respond_to do |format|
      #if @survey_result.update(survey_result_params)
      if @survey_result = SurveyResult.new(params[:survey_result])
        format.html { redirect_to user_survey_results_url(survey_user,@survey_result), notice: 'Survey result was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @survey_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_results/1
  # DELETE /survey_results/1.json
  def destroy
    @survey_result.destroy
    respond_to do |format|
      format.html { redirect_to user_survey_results_url(survey_user,@survey_results) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_result
      @survey_result = SurveyResult.find(params[:id])
    end
    # def set_user
    #   @survey_user = survey_user
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def survey_result_params
    #   params.require(:survey_result).permit(:survey_id, :user_id, :total_E, :total_I, :total_S, :total_N, :total_T, :total_F, :total_J, :total_P, :survey_answers)
    # end
end
