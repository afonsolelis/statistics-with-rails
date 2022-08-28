# frozen_string_literal: true

class MediansController < ApplicationController
  before_action :set_median, only: %i[show update destroy]

  # GET /medians
  # GET /medians.json
  def index
    @medians = Median.all
  end

  # GET /medians/1
  # GET /medians/1.json
  def show; end

  # POST /medians
  # POST /medians.json
  def create
    @median = Median.new(median_params)

    if @median.save
      render :show, status: :created, location: @median
    else
      render json: @median.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /medians/1
  # PATCH/PUT /medians/1.json
  def update
    if @median.update(median_params)
      render :show, status: :ok, location: @median
    else
      render json: @median.errors, status: :unprocessable_entity
    end
  end

  # DELETE /medians/1
  # DELETE /medians/1.json
  def destroy
    @median.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_median
    @median = Median.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def median_params
    params.require(:median).permit(:received, :response)
  end
end
