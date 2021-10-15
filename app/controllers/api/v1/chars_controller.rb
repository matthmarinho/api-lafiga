class Api::V1::CharsController < ApplicationController
  before_action :set_char, only: [:show, :update, :destroy]

  def index
    @chars = Char.all

    render json: @chars
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
      render json: @char
    else
      render json: @char.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @char.destroy
  end

  private
    def set_char
      @char = Char.find(params[:id])
    end

    def char_params
      params.fetch(:char, {})
    end
end
