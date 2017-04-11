class CardsController < ApplicationController

  # POST /cards
  def create
    @card = Card.new(card_params)

    if @card.save
      render json: @card, status: :created
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def card_params
      params.permit(:card_number, :expiration_month, :expiration_year, :secure_code)
    end
end
