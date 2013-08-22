class PersonalityTypesController < ApplicationController
  before_filter :authorize, except: [:show]
  before_action :set_personality_type, only: [:show, :edit, :update, :destroy]
  # before_action :set_survey

  # GET /personality_types
  # GET /personality_types.json
  def index
    @personality_types = PersonalityType.all
  end

  # GET /personality_types/1
  # GET /personality_types/1.json
  def show
  end

  # GET /personality_types/new
  def new
    @personality_type = PersonalityType.new
  end

  # GET /personality_types/1/edit
  def edit
  end

  # POST /personality_types
  # POST /personality_types.json
  def create
    #@category = PersonalityType.new(category_params)
    @personality_type = PersonalityType.new(params[:personality_type])
    respond_to do |format|
      if @personality_type.save
        format.html { redirect_to survey_personality_types_url(@survey,@personality_type), notice: 'PersonalityType was successfully created.' }
        format.json { render action: 'show', status: :created, location: @personality_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @personality_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personality_types/1
  # PATCH/PUT /personality_types/1.json
  def update
    respond_to do |format|
      if @personality_type.update(params[:personality_type])
        format.html { redirect_to survey_personality_types_url(@survey,@personality_type), notice: 'PersonalityType was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @personality_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personality_types/1
  # DELETE /personality_types/1.json
  def destroy
    @personality_type.destroy
    respond_to do |format|
      format.html { redirect_to survey_personality_types_url(@survey) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personality_type
      @personality_type = PersonalityType.find(params[:id])
    end

    def set_survey
      @survey = Survey.find(params[:survey_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    #def category_params
     # params.require(:category).permit(:name, :title, :message)
    #end
end
