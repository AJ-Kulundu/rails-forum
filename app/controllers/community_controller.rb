class CommunityController < ApplicationController
    skip_before_action :authenticate_user!, only: %i[index show]
    before_action :set_community, only: %i[show edit update destroy]

    def index
        @communities = Community.all
    end

    def show; end

    def new
        @community = Community.new
    end

    private

    def community_params
        params.require(:community).permit(:name, :description)
    end

    def set_community
        @community = Community.find(params[:id])
    end

end
