class ChargesController < ApplicationController
  # POST /charges
  def create
    @charge        = Charge.new(amount: charge_params[:amount])
    tokenized_card = Card.tokenized(params[:card_token]).take
    if tokenized_card.nil?
      return render json: { card_token: 'invalid or expired token' }, status: :unprocessable_entity
    end
    if tokenized_card.is_charged?
      return render json: { card_token: 'already charged' }, status: :unprocessable_entity
    end
    @charge.card = tokenized_card
    if @charge.save
      render json: @charge, status: :created
    else
      render json: @charge.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def charge_params
      params.permit(:amount, :card_token)
    end
end
