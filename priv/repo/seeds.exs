# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FlybraryApi.Repo.insert!(%SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
FlybraryApi.Repo.insert! %FlybraryApi.Resource{title: "Learn Ruby the Awesome Way", 
  description: "this book is an awesome way to learn Ruby.", 
  url: "www.awesomerubybook.com", topic: "Ruby"}

FlybraryApi.Repo.insert! %FlybraryApi.Resource{title: "Ember for Cats", 
  description: "teach your cat to program in Ember!", 
  url: "www.emberkitties.com", topic: "Ember"}

FlybraryApi.Repo.insert! %FlybraryApi.Resource{title: "Agile Acrobats Blog", 
  description: "The Big Apple Circus company blog about their agile practices as applied to real-world situations.", 
  url: "www.bigapplecircus.com/blog", topic: "Agile Development"}

FlybraryApi.Repo.insert! %FlybraryApi.Resource{title: "Gems Gems Gems", 
  description: "great tutorial on building a Ruby gem", 
  url: "www.gemsgemsgems.com", topic: "Ruby"}