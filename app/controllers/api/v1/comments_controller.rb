module Api
    module V1
        class CommentsController < ApiController
            def index
                @post = Post.find(params[:post_id])
                @comments = @post.comments
            end
        end
    end
end