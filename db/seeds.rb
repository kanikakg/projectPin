# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# categories = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])


 	Category.where(name: 'Education').first_or_create(name: 'Education')
	Category.where(name: 'Travel').first_or_create(name: 'Travel')
	Category.where(name: 'Quotes and Books').first_or_create(name: 'Quotes and Books')
	Category.where(name: 'Technology').first_or_create(name: 'Technology')
	Category.where(name: 'Health and Fitness').first_or_create(name: 'Health and Fitness')
	Category.where(name: 'Beauty').first_or_create(name: 'Beauty')
	Category.where(name: 'Photography').first_or_create(name: 'Photography')
	Category.where(name: 'Entertainment').first_or_create(name: 'Entertainment')
	Category.where(name: 'Architecture').first_or_create(name: 'Architecture and Design')
	Category.where(name: 'Sports and Workout').first_or_create(name: 'Sports and Workout')
	Category.where(name: 'Fashion').first_or_create(name: 'Fashion')
