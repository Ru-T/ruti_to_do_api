20.times do
  ToDo.create(title: Faker::Lorem.sentence, is_completed: [true, false].sample)
end
