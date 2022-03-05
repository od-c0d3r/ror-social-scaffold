json.comments @comments do |comment|
  json.id comment.id
  json.user do
    json.id comment.user.id
    json.name comment.user.name
  end
  json.content comment.content
  json.created_at comment.created_at
end
