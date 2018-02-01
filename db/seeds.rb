PROJECT_TITLES = 10.times.map { FFaker::Internet.domain_word }
puts PROJECT_TITLES

SPLIT = 0.4
OFFSET = PROJECT_TITLES.size * SPLIT

PROJECT_USERS = {
  'Fiz@test.com' => PROJECT_TITLES[0, OFFSET],
  'Baz@test.com' => PROJECT_TITLES[OFFSET..-1]
}.freeze

PROJECT_USERS.each do |email, projects|
  user = User.new(email: email, password: 'secret')
  projects.each { |title| user.projects.build(title: title) }
  user.save
end
