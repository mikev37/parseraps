class WriteInsController < ApplicationController
  before_action :set_write_in, only: [:show, :edit, :update, :destroy]

  # GET /write_ins
  # GET /write_ins.json
  def index
    @write_ins = WriteIn.all
  end

  # GET /write_ins/1
  # GET /write_ins/1.json
  def show
  end

  # GET /write_ins/new
  def new
    @write_in = WriteIn.new
  end

  # GET /write_ins/1/edit
  def edit
  end

  # POST /write_ins
  # POST /write_ins.json
  def create
    @write_in = WriteIn.new(write_in_params)

    respond_to do |format|
      if @write_in.save
        format.html { redirect_to @write_in, notice: 'Write in was successfully created.' }
        format.json { render action: 'show', status: :created, location: @write_in }
      else
        format.html { render action: 'new' }
        format.json { render json: @write_in.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /write_ins/1
  # PATCH/PUT /write_ins/1.json
  def update
    respond_to do |format|
      if @write_in.update(write_in_params)
        format.html { redirect_to @write_in, notice: 'Write in was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @write_in.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /write_ins/1
  # DELETE /write_ins/1.json
  def destroy
    @write_in.destroy
    respond_to do |format|
      format.html { redirect_to write_ins_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_write_in
      @write_in = WriteIn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def write_in_params
      params.require(:write_in).permit(:address, :input)
    end
end
