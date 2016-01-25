10.times do
  ToDo.create(title: Faker::Lorem.sentence, is_completed: true)
end

10.times do
  ToDo.create(title: Faker::Lorem.sentence, is_completed: false)
end
