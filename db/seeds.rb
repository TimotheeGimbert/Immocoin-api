require 'faker'

Property.destroy_all
User.destroy_all

def loading_bar(i, total, action)
  count = i * 50 / total
  system('clear')
  puts action
  puts "#{i * 100 / total}% [#{'#' * count}#{' ' * (50 - count)}]"
end

loading_bar(1, 4, 'creating users')
user1 = User.create(
  email: 'boris@yopmail.com',
  password: "password",
  first_name: 'boris',
  last_name: 'legroskiki'
)
user1.avatar.attach(
  io: File.open(Rails.root.join('app', 'assets', "avatar1.jpg")),
  filename: 'avatar.jpg'
)

loading_bar(2, 4, 'creating users')
user2 = User.create(
  email: 'pierre@yopmail.com',
  password: "password",
  first_name: 'pierre',
  last_name: 'lemalealpha'
)
user2.avatar.attach(
  io: File.open(Rails.root.join('app', 'assets', "avatar2.jpg")),
  filename: 'avatar.jpg'
)

loading_bar(3, 4, 'creating users')
user3 = User.create(
  email: 'thimothee@yopmail.com',
  password: "password",
  first_name: 'thimothee',
  last_name: 'ledormeur'
)
user3.avatar.attach(
  io: File.open(Rails.root.join('app', 'assets', "avatar3.jpg")),
  filename: 'avatar.jpg'
)

loading_bar(4, 4, 'creating users')
user4 = User.create(
  email: 'anthony@yopmail.com',
  password: "password",
  first_name: 'anthony',
  last_name: 'legenieduback'
)
user4.avatar.attach(
  io: File.open(Rails.root.join('app', 'assets', "avatar4.jpg")),
  filename: 'avatar.jpg'
)

titles = ['Maison Lumineuse & Calme de la Citadelle', 'Coeur Historique au bord des remparts', 'Lodge du Domaine de l\'étang Fourchu', 'La Pensine du Célèbre Sorcier', 'Les studios de Flo', 'Les gîtes de la Bergeraine', 'Escapade au Coeur de la Vieille Ville', 'À l\'Ombre du Ginkgo', 'Le Toit-Terrasse du Lion d\'Or de Stuttgart', 'Charmant demeure de “Frida”', 'Appartement de rêve dans un emplacement idéal', 'Appartement WOODWOOD près de l\'aéroport']

30.times do |i|
  loading_bar(i + 1, 30, 'creating Properties')

  property = Property.create(
    title: titles[rand(1..titles.length)],
    price: rand(9_999_999),
    description: Faker::House.room + ' ' + Faker::House.furniture + ' ' + Faker::House.furniture,
    address: Faker::Address.full_address,
    user: User.find(rand(1..3))
  )

  property.picture.attach(
    io: File.open(Rails.root.join('app', 'assets', "property#{rand(1..5)}.jpg")),
    filename: 'property.jpg'
  )
end
