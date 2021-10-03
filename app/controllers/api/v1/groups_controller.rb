class Api::V1::GroupsController < ApplicationController
    # before_action :authorize_request
    before_action :find_group, only: [:index, :update, :destroy]

    def index
        @groups = Group.all
        render json: @groups, status: :ok, each_serializer: GroupsSerializer
    end
    
    def new
        @group = Group.new
    end

    def create
        @group = Group.new(group_params)
        if @group.save
            render json: @group, status: :created
        else
            render json: { errors: @group.errors.full_messages },
                           status: :unprocessable_entity
        end
    end

    def show
        @groups = Group.where("groups.id = (?)", params[:id])
        render json: @groups, status: :ok, each_serializer: GroupsSerializer
    end

    def update
        Group::Player.find(params[:player_id]).destroy if params[:player_id] && params[:remove]
        
        if params[:players_attributes] && params[:new_player]
            params[:players_attributes].permit!
            player = Group::Player.new(params[:players_attributes])
            player.save!
        end

        update_group = @group.update(group_params) if !params[:new_player] && !params[:remove]
        
        if !update_group && !params[:new_player] && !params[:remove]
            render json: { errors: @group.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    def destroy
        @group.destroy
    end

    private

    def group_params
        params.require(:group).permit(:id, :name, :season, :day, :new_player, :remove,:player_id, players_attributes: [:name, :group_id] )
    end




    def find_group
        @group = Group.find_by_id(params[:id])
    end
    
end
    