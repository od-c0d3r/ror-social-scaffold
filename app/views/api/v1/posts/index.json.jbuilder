json.posts @posts do |post|
  json.id post.id
  json.user do
    json.id post.user.id
    json.name post.user.name
  end
  json.content post.content
  json.created_at post.created_at
end