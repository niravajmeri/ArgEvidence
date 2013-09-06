class ArgumentsController < ApplicationController

  #load_and_authorize_resource

  # GET /arguments
  # GET /arguments.json
  def index
    @arguments = Argument.all

    @argument = Argument.new
    #@users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @arguments }
    end
  end

  # GET /arguments/1
  # GET /arguments/1.json
  def show
    @argument = Argument.find(params[:id])

    @evidences = @argument.evidences
    @evidence = Evidence.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @argument }
    end
  end

  # GET /arguments/new
  # GET /arguments/new.json
  def new
    @argument = Argument.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @argument }
    end
  end

  # GET /arguments/1/edit
  def edit
    @arguments = Argument.all
    @argument = Argument.find(params[:id])
  end

  # POST /arguments
  # POST /arguments.json
  def create
    @argument = Argument.new(params[:argument])
    @argument.user_id = session[:user_id]
	#@argument.evidences = params[:argument][:evidence_ids]

    respond_to do |format|
      if @argument.save
        format.html { 
          #redirect_to @argument, notice: 'Argument was successfully created.' 
          redirect_to arguments_url, notice: 'Argument was successfully created.' 
        }
        format.json { render json: @argument, status: :created, location: @argument }
      else
        format.html { render action: "new" }
        format.json { render json: @argument.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /arguments/1
  # PUT /arguments/1.json
  def update
    @argument = Argument.find(params[:id])

    respond_to do |format|
      if @argument.update_attributes(params[:argument])
        format.html { 
			#redirect_to @argument, notice: 'Argument was successfully updated.' 
			redirect_to arguments_url, notice: 'Argument was successfully updated.' 
		}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @argument.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arguments/1
  # DELETE /arguments/1.json
  def destroy
    @argument = Argument.find(params[:id])
    @argument.destroy

    respond_to do |format|
      format.html { redirect_to arguments_url }
      format.json { head :no_content }
    end
  end
end
