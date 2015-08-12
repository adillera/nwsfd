# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
feeds_array = [
  {
    name: 'Inquirer.net',
    rss_url: 'http://www.inquirer.net/feed'
  }
]

feeds_array.each do |f|
  unless Feed.exists?(name: f[:name]) || Feed.exists?(rss_url: f[:rss_url])
    Feed.create(f)
  end
end
