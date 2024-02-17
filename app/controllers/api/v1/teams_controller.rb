class Api::V1::TeamsController < ApplicationController
  before_action :set_team, only: [:show, :update, :destroy]

  def index
    @teams = Team.all
    render json: @teams, status: :ok, each_serializer: TeamAdminSerializer
  end

  def show
    render json: @team
  end

  def create
    @team = Team.new(team_params)

    chars = []
    char_params['chars'].each do |char|
      chars << Char.find_by_id(char['id'])
    end

    @team.chars = chars
    
    if @team.save
      render json: @team, status: :created
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  def update
    if char_params['chars']
      chars = []
      char_params['chars'].each do |char|
        chars << Char.find_by_id(char['id'])
      end
      @team.chars = chars
    end
    
    if @team.update(team_params)
      render json: @team
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  def remove_in_batches
    @teams = JSON.parse(team_destroy_params[:data])
    @teams.each do |team|
      Team.find_by_id(team['id']).destroy
    end
  end

  def destroy
    @team.destroy
  end

  private
    def set_team
      @team = Team.find(team_params[:id])
    end

    def team_params
      params.permit(:id, :name, :season, :day, :description, :color)
    end

    def char_params
      params.permit(chars: [:id, :name, :race, :sub_race, :klass, :sub_class, :level])
    end

    def team_destroy_params
      params.permit(:data).to_h
    end
end
