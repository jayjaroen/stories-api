json.stories do
  json.array! @stories do |story|
    json.extract! story, :id, :name, :text, :image
  end
end
