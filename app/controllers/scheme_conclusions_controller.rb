class SchemeConclusionsController < ApplicationController
  # GET /scheme_conclusions
  # GET /scheme_conclusions.json
  def index
    @scheme_conclusions = SchemeConclusion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scheme_conclusions }
    end
  end

  # GET /scheme_conclusions/1
  # GET /scheme_conclusions/1.json
  def show
    @scheme_conclusion = SchemeConclusion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scheme_conclusion }
    end
  end

  # GET /scheme_conclusions/new
  # GET /scheme_conclusions/new.json
  def new
    @scheme_conclusion = SchemeConclusion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @scheme_conclusion }
    end
  end

  # GET /scheme_conclusions/1/edit
  def edit
    @scheme_conclusion = SchemeConclusion.find(params[:id])
  end

  # POST /scheme_conclusions
  # POST /scheme_conclusions.json
  def create
    @scheme_conclusion = SchemeConclusion.new(params[:scheme_conclusion])

    respond_to do |format|
      if @scheme_conclusion.save
        format.html { redirect_to @scheme_conclusion, notice: 'Scheme conclusion was successfully created.' }
        format.json { render json: @scheme_conclusion, status: :created, location: @scheme_conclusion }
      else
        format.html { render action: "new" }
        format.json { render json: @scheme_conclusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /scheme_conclusions/1
  # PUT /scheme_conclusions/1.json
  def update
    @scheme_conclusion = SchemeConclusion.find(params[:id])

    respond_to do |format|
      if @scheme_conclusion.update_attributes(params[:scheme_conclusion])
        format.html { redirect_to @scheme_conclusion, notice: 'Scheme conclusion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scheme_conclusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scheme_conclusions/1
  # DELETE /scheme_conclusions/1.json
  def destroy
    @scheme_conclusion = SchemeConclusion.find(params[:id])
    @scheme_conclusion.destroy

    respond_to do |format|
      format.html { redirect_to scheme_conclusions_url }
      format.json { head :no_content }
    end
  end
end
