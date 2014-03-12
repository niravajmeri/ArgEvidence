class InferenceRulesController < ApplicationController
  # GET /inference_rules
  # GET /inference_rules.json
  def index
    @inference_rules = InferenceRule.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @inference_rules }
    end
  end

  # GET /inference_rules/1
  # GET /inference_rules/1.json
  def show
    @inference_rule = InferenceRule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @inference_rule }
    end
  end

  # GET /inference_rules/new
  # GET /inference_rules/new.json
  def new
    @inference_rule = InferenceRule.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @inference_rule }
    end
  end

  # GET /inference_rules/1/edit
  def edit
    @inference_rule = InferenceRule.find(params[:id])
  end

  # POST /inference_rules
  # POST /inference_rules.json
  def create
    @inference_rule = InferenceRule.new(params[:inference_rule])

    respond_to do |format|
      if @inference_rule.save
        format.html { redirect_to @inference_rule, notice: 'Inference rule was successfully created.' }
        format.json { render json: @inference_rule, status: :created, location: @inference_rule }
      else
        format.html { render action: "new" }
        format.json { render json: @inference_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /inference_rules/1
  # PUT /inference_rules/1.json
  def update
    @inference_rule = InferenceRule.find(params[:id])

    respond_to do |format|
      if @inference_rule.update_attributes(params[:inference_rule])
        format.html { redirect_to @inference_rule, notice: 'Inference rule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @inference_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inference_rules/1
  # DELETE /inference_rules/1.json
  def destroy
    @inference_rule = InferenceRule.find(params[:id])
    @inference_rule.destroy

    respond_to do |format|
      format.html { redirect_to inference_rules_url }
      format.json { head :no_content }
    end
  end
end
