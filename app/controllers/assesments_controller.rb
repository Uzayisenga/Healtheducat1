class AssesmentsController < ApplicationController
  before_action :set_assesment, only: [:show, :edit, :update, :destroy]


  
  # GET /assesments
  # GET /assesments.json
  def index
    questions = Assesment.all
    respond_to do |format|
      format.html { render :index, locals: { questions: questions } }
      
    end
  end
  
  # GET /assesments/1
  # GET /assesments/1.json
  def show
    question = Assesment.find(params[:id])
    @answers.includes(:answers).find_by(params[:id]) 
    respond_to do |format|
      format.html { render :show, locals: { question: question } }
    end
  end

  # GET /assesments/new
  def new
    @assesment = Assesment.new
  end

  # GET /assesments/1/edit
  def edit
  end

  # POST /assesments
  # POST /assesments.json
  def create
    @assesment = Assesment.new(assesment_params)

    respond_to do |format|
      if @assesment.save
        format.html { redirect_to @assesment, notice: 'Assesment was successfully created.' }
        format.json { render :show, status: :created, location: @assesment }
      else
        format.html { render :new }
        format.json { render json: @assesment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assesments/1
  # PATCH/PUT /assesments/1.json
  def update
    respond_to do |format|
      if @assesment.update(assesment_params)
        format.html { redirect_to @assesment, notice: 'Assesment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assesment }
      else
        format.html { render :edit }
        format.json { render json: @assesment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assesments/1
  # DELETE /assesments/1.json
  def destroy
    @assesment.destroy
    respond_to do |format|
      format.html { redirect_to assesments_url, notice: 'Assesment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  def grading
    @assesment ||= Assesment.find(session[:assesment_id]) if session[:assesment_id]
    total = @assesment.questions.count.to_i
   
    session[:total]   = total
    session[:correct] = 0
    @total   = session[:total]
   
    answerid = params[:answer]
    @answer = answerid ? Answer.find(answerid) : nil
   
   
    if @answer and @answer.correct
      @correct = true
      session[:correct] += 1
    else
     @correct = false
    end
   
    redirect_to results_url
   end
   
   def results
     @correct = session[:correct]
     @total   = session[:total]
   
     @score = @correct * 100 / @total
   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assesment
      @assesment = Assesment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assesment_params
      params.require(:assesment).permit(:question, :answer, :distractor_1, :distractor_2, :distractor_3)
    end
end
