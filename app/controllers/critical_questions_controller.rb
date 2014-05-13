class CriticalQuestionsController < ApplicationController
  # GET /critical_questions
  # GET /critical_questions.json
  def index
    @critical_questions = CriticalQuestion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @critical_questions }
    end
  end

  # GET /critical_questions/1
  # GET /critical_questions/1.json
  def show
    @critical_question = CriticalQuestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @critical_question }
    end
  end

  # GET /critical_questions/new
  # GET /critical_questions/new.json
  def new
    @critical_question = CriticalQuestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @critical_question }
    end
  end

  # GET /critical_questions/1/edit
  def edit
    @critical_question = CriticalQuestion.find(params[:id])
  end

  # POST /critical_questions
  # POST /critical_questions.json
  def create
    @critical_question = CriticalQuestion.new(params[:critical_question])

    respond_to do |format|
      if @critical_question.save
        format.html { redirect_to @critical_question, notice: 'Critical question was successfully created.' }
        format.json { render json: @critical_question, status: :created, location: @critical_question }
      else
        format.html { render action: "new" }
        format.json { render json: @critical_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /critical_questions/1
  # PUT /critical_questions/1.json
  def update
    @critical_question = CriticalQuestion.find(params[:id])

    respond_to do |format|
      if @critical_question.update_attributes(params[:critical_question])
        format.html { redirect_to @critical_question, notice: 'Critical question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @critical_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /critical_questions/1
  # DELETE /critical_questions/1.json
  def destroy
    @critical_question = CriticalQuestion.find(params[:id])
    @critical_question.destroy

    respond_to do |format|
      format.html { redirect_to critical_questions_url }
      format.json { head :no_content }
    end
  end
end
