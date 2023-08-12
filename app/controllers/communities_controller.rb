class CommunitiesController < ApplicationController
    skip_before_action :authenticate_user!, only: %i[index show]
    before_action :set_community, only: %i[show edit update destroy]

    def index
        @communities = Community.all
    end

    def show
        @members = @community.members.includes(:user)
        console
    end

    def new
        @community = Community.new
    end

    def create
        @community = Community.new(community_params)
        if @community.save
            redirect_to communities_path if @community.members.create(community_id: @community.id, user: current_user, role: :admin)
        else
            render :new
        end
    end

    private

    def community_params
        params.require(:community).permit(:name, :description,:private)
    end

    def set_community
        @community = Community.find(params[:id])
    end
end
