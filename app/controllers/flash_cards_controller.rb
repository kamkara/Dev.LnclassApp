class FlashCardsController < ApplicationController
  before_action :set_flash_card, only: %i[ show edit update destroy ]

  before_action :authenticate_user!
  before_action :set_course
  # GET /flash_cards or /flash_cards.json
  def index
    @flash_cards = FlashCard.all
  end

  # GET /flash_cards/1 or /flash_cards/1.json
  def show
  end

  # GET /flash_cards/new
  def new
    @flash_card = @course.flash_cards.build
  end

  # GET /flash_cards/1/edit
  def edit
  end

  # POST /flash_cards or /flash_cards.json
  def create
    @flash_card = current_user.flash_cards.build(flash_card_params)
   
    respond_to do |format|
      if @flash_card.save
        format.html { redirect_to course_path(@course), notice: "Flash card was successfully created." }
        format.json { render :show, status: :created, location: @flash_card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flash_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flash_cards/1 or /flash_cards/1.json
  def update
    respond_to do |format|
      if @flash_card.update(flash_card_params)
        format.html { redirect_to course_path(@course), notice: "Flash card was successfully updated." }
        format.json { render :show, status: :ok, location: @flash_card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flash_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flash_cards/1 or /flash_cards/1.json
  def destroy
    @flash_card.destroy

    respond_to do |format|
      format.html { redirect_to course_path(@course), notice: "Flash card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flash_card
      @flash_card = course.flash_cards.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flash_card_params
      params.require(:flash_card).permit(:title, :slug, :course_id, :user_id)
    end

    def set_course
      @course = Course.friendly.find(params[:course_id])
    end
end
