# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
[User, Song].each do |klass|
  klass.delete_all
end


user = User.create!(
  :username => 'admin',
  :email => 'example@example.com',
  :password => 'password',
  :password_confirmation => 'password'
)

puts "'admin' user is created. Password is 'password'"

20.times do
  Song.create!(
    :name => Faker::Lorem.words(3).join(' '),
    :user => user,
    :description => Faker::Lorem.paragraph(1),
    :genre => Song::GENRES.shuffle[0]
  )
end

puts "20 songs created. Tied to '#{user.username}'"
