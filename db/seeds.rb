# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
params = YAML.load_file(Dir.pwd + "/db/seeds.yml")

data = params['projects']
data.each do |arr|

  project = Project.create(title: arr['title'])
  arr['todos'].each do |task|
    task = Task.new(task)
    task.project = project
    task.save
  end
end
