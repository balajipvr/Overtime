50.times do |post|
  Post.create(date: Date.today, rationale: "#{post} Creted rationale")
end

p "50 post created"
