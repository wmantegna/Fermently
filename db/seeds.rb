# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


@b = BreweryDB::Client.new do |c|
	c.api_key = "b31b22b5b383cdcf086127513013704d"
end

@styles = @b.styles.all

#BeerStyle.delete_all


@styles.each do |s|
	BeerStyle.create(
		id: s.id, 
		category: s.category.name, 
		name: s.name, 
		description: s.description, 
		ibuMin: s.ibu_min, 
		ibuMax: s.ibu_max, 
		abvMin: s.abv_min, 
		abvMax: s.abv_max, 
		srmMin: s.srm_min, 
		srmMax: s.srm_max, 
		ogMin: s.og_min, 
		fgMin: s.fg_min,
		fgMax: s.fg_max)
end