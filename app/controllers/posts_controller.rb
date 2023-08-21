class PostsController < ApplicationController
    before_action :set_community
    before_action :set_post, only: %i[show edit update destroy]
    def index
        @posts = Post.all.community(@community.id).ordered
    end

    def new
        @post = @community.posts.build
    end

    def create
        @post = @community.posts.build(post_params)

        if @post.save
            redirect_to community_path(@community)
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
