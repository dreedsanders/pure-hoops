class ActionCardsController < ApplicationController
  before_action :set_action_card, only: %i[ show edit update destroy ]

  # GET /action_cards or /action_cards.json
  def index
    @action_cards = ActionCard.all
    render json: @action_cards
  end

  # GET /action_cards/1 or /action_cards/1.json
  def show
  end

  # GET /action_cards/new
  def new
    @action_card = ActionCard.new
  end

  # GET /action_cards/1/edit
  def edit
  end

  # POST /action_cards or /action_cards.json
  def create
    @action_card = ActionCard.new(action_card_params)

    respond_to do |format|
      if @action_card.save
        format.html { redirect_to @action_card, notice: "Action card was successfully created." }
        format.json { render :show, status: :created, location: @action_card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @action_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /action_cards/1 or /action_cards/1.json
  def update
    respond_to do |format|
      if @action_card.update(action_card_params)
        format.html { redirect_to @action_card, notice: "Action card was successfully updated." }
        format.json { render :show, status: :ok, location: @action_card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @action_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /action_cards/1 or /action_cards/1.json
  def destroy
    @action_card.destroy

    respond_to do |format|
      format.html { redirect_to action_cards_path, status: :see_other, notice: "Action card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_action_card
      @action_card = ActionCard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def action_card_params
      params.require(:action_card).permit(:title, :description, :type)
    end
end
