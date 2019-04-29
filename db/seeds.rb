# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

project = Project.find_or_create_by(name: "Build", description: "making the thing", date_started: Date.today)
Proposal.find_or_create_by(project_id: project.id, client_name: "Upper", prepared_for: "Matt", prepared_by: "Justin")
