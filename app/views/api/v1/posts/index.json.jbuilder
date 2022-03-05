json.posts @posts do |post|
  json.id post[0].id
  json.user do
    json.id post[0].user.id
    json.name post[0].user.name
  end
  json.content post[0].content
  json.created_at post[0].created_at
end
