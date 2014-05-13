class PremisesController < ApplicationController
  # GET /premises
  # GET /premises.json
  def index
    @premises = Premise.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @premises }
    end
  end

  # GET /premises/1
  # GET /premises/1.json
  def show
    @premise = Premise.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @premise }
    end
  end

  # GET /premises/new
  # GET /premises/new.json
  def new
    @premise = Premise.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @premise }
    end
  end

  # GET /premises/1/edit
  def edit
    @premise = Premise.find(params[:id])
  end

  # POST /premises
  # POST /premises.json
  def create
    @premise = Premise.new(params[:premise])

    respond_to do |format|
      if @premise.save
        format.html { redirect_to @premise, notice: 'Premise was successfully created.' }
        format.json { render json: @premise, status: :created, location: @premise }
      else
        format.html { render action: "new" }
        format.json { render json: @premise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /premises/1
  # PUT /premises/1.json
  def update
    @premise = Premise.find(params[:id])

    respond_to do |format|
      if @premise.update_attributes(params[:premise])
        format.html { redirect_to @premise, notice: 'Premise was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @premise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /premises/1
  # DELETE /premises/1.json
  def destroy
    @premise = Premise.find(params[:id])
    @premise.destroy

    respond_to do |format|
      format.html { redirect_to premises_url }
      format.json { head :no_content }
    end
  end
end
