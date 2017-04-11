class ChargesController < ApplicationController
  before_action :set_charge, only: [:show, :update, :destroy]

  # GET /charges
  def index
    @charges = Charge.all

    render json: @charges
  end

  # GET /charges/1
  def show
    render json: @charge
  end

  # POST /charges
  def create
    @charge = Charge.new(charge_params)

    if @charge.save
      render json: @charge, status: :created, location: @charge
    else
      render json: @charge.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /charges/1
  def update
    if @charge.update(charge_params)
      render json: @charge
    else
      render json: @charge.errors, status: :unprocessable_entity
    end
  end

  # DELETE /charges/1
  def destroy
    @charge.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_charge
      @charge = Charge.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def charge_params
      params.require(:charge).permit(:amount, :card_id)
    end
end
