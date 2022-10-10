class Api::V1::CharsController < ApplicationController
  before_action :set_char, only: [:show, :update, :destroy]

  def index
    @chars = Char.all

    render json: @chars, status: :ok, each_serializer: CharSerializer
  end

  def show
    render json: @char
  end

  def create
    @char = Char.new(char_params)

    if @char.save
      render json: @char, status: :created, location: @char
    else
      render json: @char.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @char.update(char_params)
      render json: @char, status: :ok, each_serializer: CharSerializer
    else
      render json: @char.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @char.destroy
  end

  def remove_in_batches
    @char = JSON.parse(char_destroy_params[:data])
    @char.each do |char|
      Char.find_by_id(char['id']).destroy
    end
  end

  def without_team
    @chars = Char.includes(:team).where(chars_teams: { id: nil })
    render json: @chars, status: :ok, each_serializer: CharSerializer
  end

  private
    def set_char
      @char = Char.find(params[:id])
    end

    def char_params
      params.permit(:id, :name, :race, :sub_race, :klass, :sub_class, :level)
    end

    def char_destroy_params
      params.permit(:data).to_h
    end
end
