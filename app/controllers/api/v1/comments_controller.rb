module Api
    module V1
        class CommentsController < ApiController
            def index
                post = Post.find(params[:post_id])
                @comments = post.comments
            end

            def create
                @comment = Comment.new(comment_params)
                @comment.post_id = params[:post_id]
                @comment.user = current_user
            
                if @comment.save
                  head :created
                else
                  head :no_content
                end
              end
            
              private
            
              def comment_params
                params.require(:comment).permit(:content)
              end
        end
    end
end
