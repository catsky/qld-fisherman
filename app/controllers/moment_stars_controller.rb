class MomentStarsController < ApplicationController
  before_action :set_moment_star, only: [:show, :edit, :update, :destroy]

  # GET /moment_stars
  # GET /moment_stars.json
  def index
    @moment_stars = MomentStar.all
  end

  # GET /moment_stars/1
  # GET /moment_stars/1.json
  def show
  end

  # GET /moment_stars/new
  def new
    @moment_star = MomentStar.new
  end

  # GET /moment_stars/1/edit
  def edit
  end

  # POST /moment_stars
  # POST /moment_stars.json
  def create
    @moment_star = MomentStar.new(moment_star_params)

    respond_to do |format|
      if @moment_star.save
        format.html { redirect_to @moment_star, notice: 'Moment star was successfully created.' }
        format.json { render action: 'show', status: :created, location: @moment_star }
      else
        format.html { render action: 'new' }
        format.json { render json: @moment_star.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moment_stars/1
  # PATCH/PUT /moment_stars/1.json
  def update
    respond_to do |format|
      if @moment_star.update(moment_star_params)
        format.html { redirect_to @moment_star, notice: 'Moment star was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @moment_star.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moment_stars/1
  # DELETE /moment_stars/1.json
  def destroy
    @moment_star.destroy
    respond_to do |format|
      format.html { redirect_to moment_stars_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moment_star
      @moment_star = MomentStar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def moment_star_params
      params.require(:moment_star).permit(:moment_id, :user_id)
    end
end
