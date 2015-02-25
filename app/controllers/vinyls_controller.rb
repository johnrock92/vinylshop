class VinylsController < ApplicationController
  # GET /vinyls
  # GET /vinyls.json
  def index
    @vinyls = Vinyl.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vinyls }
    end
  end

  # GET /vinyls/1
  # GET /vinyls/1.json
  def show
    @vinyl = Vinyl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vinyl }
    end
  end

  # GET /vinyls/new
  # GET /vinyls/new.json
  def new
    @vinyl = Vinyl.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vinyl }
    end
  end

  # GET /vinyls/1/edit
  def edit
    @vinyl = Vinyl.find(params[:id])
  end

  # POST /vinyls
  # POST /vinyls.json
  def create
    @vinyl = Vinyl.new(params[:vinyl])

    respond_to do |format|
      if @vinyl.save
        format.html { redirect_to @vinyl, notice: 'Vinyl was successfully created.' }
        format.json { render json: @vinyl, status: :created, location: @vinyl }
      else
        format.html { render action: "new" }
        format.json { render json: @vinyl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vinyls/1
  # PUT /vinyls/1.json
  def update
    @vinyl = Vinyl.find(params[:id])

    respond_to do |format|
      if @vinyl.update_attributes(params[:vinyl])
        format.html { redirect_to @vinyl, notice: 'Vinyl was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vinyl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vinyls/1
  # DELETE /vinyls/1.json
  def destroy
    @vinyl = Vinyl.find(params[:id])
    @vinyl.destroy

    respond_to do |format|
      format.html { redirect_to vinyls_url }
      format.json { head :no_content }
    end
  end
end
