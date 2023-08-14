class MembersController < ApplicationController
    before_action :set_community, only: %i[create destroy]
    before_action :set_member, only: %i[destroy]

    def create
        @member = @community.members.create(community_id: @community.id, user: current_user)
        redirect_to @community
    end

    def destroy
        @member.destroy
        redirect_to @community
    end

    private

     def set_community
         @community = Community.find(params[:community_id])
     end

     def set_member
         @member = Member.find(params[:id])
     end
end
