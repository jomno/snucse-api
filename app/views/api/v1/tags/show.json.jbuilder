json.articles @tag.articles do |article|
  json.(article, :id, :title, :content)
  json.created_at do
    json.date article.created_at.strftime("%Y%m%d")
    json.time article.created_at.strftime("%H:%M:%S")
    json.updated article.created_at != article.updated_at
  end
  json.profiles article.profiles do |profile|
    json.(profile, :name)
    json.id profile.sid
  end
  json.writer do
    json.(article.writer, :id, :username, :name, :profile_image_uri)
  end
  json.tags article.tags do |tag|
    json.tag tag.name
  end
end
json.profiles @tag.profiles do |profile|
  json.(profile, :name, :description)
  json.id profile.sid
  json.admin do
    json.(profile.admin, :id, :username, :name)
  end
  json.tags profile.tags do |tag|
    json.tag tag.name
  end
end
