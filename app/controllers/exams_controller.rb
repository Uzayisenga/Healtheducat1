class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy]

  # GET /exams
  # GET /exams.json
  def index
    @exams = Exam.all
  end
  respond_to do |format|
    if @exam.save
      format.html { redirect_to @exam, notice: 'exam was successfully created.' }
      format.json { render :show, status: :created, location: @exam }
      format.js
    else
      format.html { render :new }
      format.json { render json: @exam.errors, status: :unprocessable_entity }
      format.js
    end
  end
  # GET /exams/1
  # GET /exams/1.json
  def show
    render js: "alert('The number is: #{params[:id]}')"
  end

  # GET /exams/new
  def new
    @exam = Exam.new
  end

  # GET /exams/1/edit
  def edit
  end

  def result
    @title = "exam Results"
  end

def score
    @mark = Score.all
end

def mark
  @mark = Score.create!(score_params)
end

  # POST /exams
  # POST /exams.json
  def create
    if validate_user
      @submission = Submission.new(submission_params)
      if @submission.save
        redirect_to '/surveys/saved'
      else
        redirect_to '/surveys/nosaved'
      end
    end
end

  # PATCH/PUT /exams/1
  # PATCH/PUT /exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to @exam, notice: 'Exam was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam }
      else
        format.html { render :edit }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy   
    @exam = Exam.find(params[:id])   
    @exam.destroy   
      
    respond_to do |format|   
       format.html { redirect_to exam_url }   
       format.json { head :no_content }   
       format.js   { render :layout => false }   
    end   
      
 end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exam_params
      params.require(:exam).permit(:marks, :attempty, :course_id, :exams_id)
    end
    def score_params
      params.permit(:exam, :score)
    end
end
