class MembersController < ApplicationController
    before_action :set_community, only: %i[create destroy]

    def create
        @member = @community.members.create(community_id: @community.id, user: current_user)
        redirect_to @community
    end

    def destroy
        @member = Member.find_by(community_id: @community.id, user: current_user)
        @member.destroy
        redirect_to communities_path
    end

    private

     def set_community
         @community = Community.find(params[:community_id])
     end
end
