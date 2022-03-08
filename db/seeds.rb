def loading_bar(i, total, action)
  count = i * 50 / total
  system('clear')
  puts action
  puts "#{i * 100 / total}% [#{'#' * count}#{' ' * (50 - count)}]"
end

loading_bar(1, 4, 'creating users')
User.create(
  email: 'boris@yopmail.com',
  password: "password",
  first_name: 'boris',
  last_name: 'legroskiki'
)

loading_bar(2, 4, 'creating users')
User.create(
  email: 'pierre@yopmail.com',
  password: "password",
  first_name: 'pierre',
  last_name: 'lemalealpha'
)

loading_bar(3, 4, 'creating users')
User.create(
  email: 'thimothee@yopmail.com',
  password: "password",
  first_name: 'thimothee',
  last_name: 'ledormeur'
)

loading_bar(4, 4, 'creating users')
User.create(
  email: 'anthony@yopmail.com',
  password: "password",
  first_name: 'anthony',
  last_name: 'legenieduback'
)

30.times do |i|
  loading_bar(i + 1, 30, 'creating Properties')

  property = Property.create(
    title: Faker::Lorem.sentence(word_count: 5),
    price: rand(9_999_999),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    address: Faker::Address.full_address,
    user: User.find(rand(1..3))
  )

  property.picture.attach(
    io: File.open(Rails.root.join('app', 'assets', "default#{rand(1..4)}.jpg")),
    filename: 'default.jpg'
  )
end
