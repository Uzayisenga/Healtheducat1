class McQuestionsController < ApplicationController
  before_action :set_mc_question, only: [:show, :edit, :update, :destroy]

  # GET /mc_questions
  # GET /mc_questions.json
  def index
    questions = McQuestion.all
    respond_to do |format|
      format.html { render :index, locals: { questions: questions } }
    end
  end

  def show
    question = McQuestion.find(params[:id])
    respond_to do |format|
      format.html { render :show, locals: { question: question } }
    end
  end

  

  # GET /mc_questions/new
  def new
    @quiz = Quiz.find(params[:quiz_id])
    @mc_question = @quiz.mc_questions.build(mc_question_params)
  end

  # GET /mc_questions/1/edit
  def edit
  end

  # POST /mc_questions
  # POST /mc_questions.json

  def create
    # find the quiz to which the new question will be added
    quiz = Quiz.find(params[:id])
    # allocate a new question associated with the quiz
    question = quiz.mc_questions.build(params.require(:mc_question).permit(:question, :answer, :distractor_1, :distractor_2, :distractor_3))
    # respond_to block
    respond_to do |format|
      # html format block
      format.html {
        if question.save
          # success message
          flash[:success] = "Question saved successfully"
          # redirect to index
          redirect_to quiz_mc_questions_url(quiz)
        else
          # error message
          flash.now[:error] = "Error: Question could not be saved"
          # render new
          render :new, locals: { quiz: quiz, question: question }
        end
      }
    end
  end
  
  # PATCH/PUT /mc_questions/1
  # PATCH/PUT /mc_questions/1.json
  def update
    respond_to do |format|
      if @mc_question.update(mc_question_params)
        format.html { redirect_to @mc_question, notice: 'Mc question was successfully updated.' }
        format.json { render :show, status: :ok, location: @mc_question }
      else
        format.html { render :edit }
        format.json { render json: @mc_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mc_questions/1
  # DELETE /mc_questions/1.json
  def destroy
    @mc_question.destroy
    respond_to do |format|
      format.html { redirect_to mc_questions_url, notice: 'Mc question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mc_question
      @mc_question = McQuestion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mc_question_params
      params.permit(:mc_question).permit(:question, :answer, :distractor_1, :distractor_2, :distractor_3, :quiz_id)
    end
end




