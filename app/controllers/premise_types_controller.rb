class PremiseTypesController < ApplicationController
  # GET /premise_types
  # GET /premise_types.json
  def index
    @premise_types = PremiseType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @premise_types }
    end
  end

  # GET /premise_types/1
  # GET /premise_types/1.json
  def show
    @premise_type = PremiseType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @premise_type }
    end
  end

  # GET /premise_types/new
  # GET /premise_types/new.json
  def new
    @premise_type = PremiseType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @premise_type }
    end
  end

  # GET /premise_types/1/edit
  def edit
    @premise_type = PremiseType.find(params[:id])
  end

  # POST /premise_types
  # POST /premise_types.json
  def create
    @premise_type = PremiseType.new(params[:premise_type])

    respond_to do |format|
      if @premise_type.save
        format.html { redirect_to @premise_type, notice: 'Premise type was successfully created.' }
        format.json { render json: @premise_type, status: :created, location: @premise_type }
      else
        format.html { render action: "new" }
        format.json { render json: @premise_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /premise_types/1
  # PUT /premise_types/1.json
  def update
    @premise_type = PremiseType.find(params[:id])

    respond_to do |format|
      if @premise_type.update_attributes(params[:premise_type])
        format.html { redirect_to @premise_type, notice: 'Premise type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @premise_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /premise_types/1
  # DELETE /premise_types/1.json
  def destroy
    @premise_type = PremiseType.find(params[:id])
    @premise_type.destroy

    respond_to do |format|
      format.html { redirect_to premise_types_url }
      format.json { head :no_content }
    end
  end
end
