class JDataController < ApplicationController
  before_action :set_j_datum, only: [:show, :edit, :update, :destroy]

  # GET /j_data
  # GET /j_data.json
  def index
    @j_data = JDatum.all
  end

  # GET /j_data/1
  # GET /j_data/1.json
  def show
  end

  # GET /j_data/new
  def new
    @j_datum = JDatum.new
  end

  # GET /j_data/1/edit
  def edit
  end

  # POST /j_data
  # POST /j_data.json
  def create
    @j_datum = JDatum.new(j_datum_params)

    respond_to do |format|
      if @j_datum.save
        format.html { redirect_to @j_datum, notice: 'JSON file was successfully created.' }
        format.json { render action: 'show', status: :created, location: @j_datum }
      else
        format.html { render action: 'new' }
        format.json { render json: @j_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /j_data/1
  # PATCH/PUT /j_data/1.json
  def update
    respond_to do |format|
      if @j_datum.update(j_datum_params)
        format.html { redirect_to @j_datum, notice: 'JSON file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @j_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /j_data/1
  # DELETE /j_data/1.json
  def destroy
    @j_datum.destroy
    respond_to do |format|
      format.html { redirect_to j_data_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_j_datum
      @j_datum = JDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def j_datum_params
      params.require(:j_datum).permit(:jInput, :jOutput)
    end
end
