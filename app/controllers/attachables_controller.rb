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
    return render(status: :not_acceptable) unless params.has_key?(:file)
    @attachable = Attachable.new(file: attachable_params)
    respond_to do |format|
      if @attachable.save
        format.html { redirect_to @attachable, notice: 'Attachable created was successfully created.' }
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
      if params[:file]
        params.require(:file)
      else
        params.require(:attachable).permit!
      end
      
    end
end
