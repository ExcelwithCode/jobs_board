# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Job.create!([
  {
  title: "Copywriter",
  category: "Software",
  location: "New York, NY",
  description: "You read copy on the train.",
  to_apply: "Send an email to Mike."
  },
  {
    title: "UX Designer",
    category: "Hardware",
    location: "Dallas, TX",
    description: "You need the touch of Ives.",
    to_apply: "Call Jobs at 555 555 5555."
  },
  {
    title: "Data Scientist",
    category: "Education",
    location: "Boston, MA",
    description: "You gotta love kids.",
    to_apply: "Drop your resume off at our office."
  }
  ])