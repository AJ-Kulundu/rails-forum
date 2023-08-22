class PostsController < ApplicationController
    before_action :set_community
    before_action :set_post, only: %i[show edit update destroy]

    def new
        @post = @community.posts.build
    end

    def create
        @post = @community.posts.build(post_params)

        if @post.save
            respond_to do |format|
                format.html {redirect_to @community}
                format.turbo_stream
            end
        else
            render :new, status: :unprocessable_entity
        end
    end


    private
         def post_params
            params.require(:post).permit(:body).merge(user: current_user)
        end

        def set_community
            @community = Community.find(params[:community_id])
        end

        def set_post
            @post = Post.find(params[:id])
        end
end
