# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.first

h = Hunt.new({title: "Easter", password: "easter"})
hu = HuntUser.new

hu.user = u
hu.hunt = h

c = Clue.new
c.text = "Somewhere cool but not cold."
c.passcode = 12345
c.location = "Inside the refridgerator"
c.index = 1

i = Image.new
i.url = "www.somewhere.com/images/1"
i.alt_text = "some image"

c.image = i
c.hunt = h

hu.save
h.save
c.save
i.save
