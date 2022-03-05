module Api
    module V1
        class PostsController < ApiController
            def index
                @posts = timeline_posts
            end

            private

            def timeline_posts
                @my_posts = current_user.posts
                @friends = Friendship.where(user_id: current_user.id, confirmed: true)
            
                @my_friends_posts = []
                @friends.each do |friendship|
                  user = User.find_by(id: friendship.friend_id)
                  @my_friends_posts << user.posts
                end

                @timeline_posts = @my_posts + @my_friends_posts
            
                @timeline_posts.compact
              end
        end
    end
end