class MomoentsController < ApplicationController
  before_action :set_momoent, only: [:show, :edit, :update, :destroy]

  # GET /momoents
  # GET /momoents.json
  def index
    @momoents = Momoent.all
  end

  # GET /momoents/1
  # GET /momoents/1.json
  def show
  end

  # GET /momoents/new
  def new
    @momoent = Momoent.new
  end

  # GET /momoents/1/edit
  def edit
  end

  # POST /momoents
  # POST /momoents.json
  def create
    @momoent = Momoent.new(momoent_params)

    respond_to do |format|
      if @momoent.save
        format.html { redirect_to @momoent, notice: 'Momoent was successfully created.' }
        format.json { render action: 'show', status: :created, location: @momoent }
      else
        format.html { render action: 'new' }
        format.json { render json: @momoent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /momoents/1
  # PATCH/PUT /momoents/1.json
  def update
    respond_to do |format|
      if @momoent.update(momoent_params)
        format.html { redirect_to @momoent, notice: 'Momoent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @momoent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /momoents/1
  # DELETE /momoents/1.json
  def destroy
    @momoent.destroy
    respond_to do |format|
      format.html { redirect_to momoents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_momoent
      @momoent = Momoent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def momoent_params
      params.require(:momoent).permit(:user_id, :message_id, :address_id)
    end
end
