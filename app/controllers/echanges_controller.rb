class EchangesController < ApplicationController
  before_action :set_echange, only: %i[ show edit update destroy ]

  # GET /echanges or /echanges.json
  def index
    @echanges = Echange.all
  end

  # GET /echanges/1 or /echanges/1.json
  def show
  end

  # GET /echanges/new
  def new
    @echange = Echange.new
  end

  # GET /echanges/1/edit
  def edit
  end

  # POST /echanges or /echanges.json
  def create
    @echange = Echange.new(echange_params)

    respond_to do |format|
      if @echange.save
        format.html { redirect_to echange_url(@echange), notice: "Echange was successfully created." }
        format.json { render :show, status: :created, location: @echange }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @echange.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /echanges/1 or /echanges/1.json
  def update
    respond_to do |format|
      if @echange.update(echange_params)
        format.html { redirect_to echange_url(@echange), notice: "Echange was successfully updated." }
        format.json { render :show, status: :ok, location: @echange }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @echange.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /echanges/1 or /echanges/1.json
  def destroy
    @echange.destroy

    respond_to do |format|
      format.html { redirect_to echanges_url, notice: "Echange was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_echange
      @echange = Echange.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def echange_params
      params.require(:echange).permit(:title, :content, :wiki, :status, :slug, :course_id, :user_id)
    end
end
