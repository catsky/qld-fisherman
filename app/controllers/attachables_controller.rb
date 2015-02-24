class AttachablesController < ApplicationController
  before_action :set_attachable, only: [:show, :edit, :update, :destroy]

  # GET /attachables
  # GET /attachables.json
  def index
    @attachables = Attachable.all
  end

  # GET /attachables/1
  # GET /attachables/1.json
  def show
  end

  # GET /attachables/new
  def new
    @attachable = Attachable.new
  end

  # GET /attachables/1/edit
  def edit
  end

  # POST /attachables
  # POST /attachables.json
  def create
    @attachable = Attachable.new(attachable_params)

    respond_to do |format|
      if @attachable.save
        format.html { redirect_to @attachable, notice: 'Attachable was successfully created.' }
        format.json { render action: 'show', status: :created, location: @attachable }
      else
        format.html { render action: 'new' }
        format.json { render json: @attachable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attachables/1
  # PATCH/PUT /attachables/1.json
  def update
    respond_to do |format|
      if @attachable.update(attachable_params)
        format.html { redirect_to @attachable, notice: 'Attachable was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attachable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachables/1
  # DELETE /attachables/1.json
  def destroy
    @attachable.destroy
    respond_to do |format|
      format.html { redirect_to attachables_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachable
      @attachable = Attachable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attachable_params
      params.require(:attachable).permit(:attachable_type, :file_file_name, :file_content_type, :file_file_size, :file_updated_at, :title, :file_processing, :file_fingerprint)
    end
end
