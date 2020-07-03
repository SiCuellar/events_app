# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.create(name: "test button", event_type: "click")
Event.create(name: "button", event_type: "no-click", event_attributes: {"button_color"=>"red"})
Event.create(name: "scroll", event_type: "something", event_attributes: {"at"=>"2020-06-12T00:00:01"})
Event.create(name: "button", event_type: "click", event_attributes: {"button_color"=>"red"})
Event.create(name: "test button", event_type: "scroll")
Event.create(name: "test button", event_type: "click", event_attributes: {"button_color"=>"green"})
