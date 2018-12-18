require 'pg'
require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  database: "safari_vacation"
)

class SeenAnimal < ActiveRecord::Base
end

def json_print data
  puts JSON.pretty_generate(data.as_json)
end

json_print SeenAnimal.all

# number = gets.chomp
# text = gets.chomp
# #{number}, #{text}
SeenAnimal.find(9).update(count_of_times_seen: "25", location_of_last_seen: "lake")

json_print SeenAnimal.where(location_of_last_seen: "jungle")

SeenAnimal.where("location_of_last_seen = ?", "desert").delete_all

json_print SeenAnimal.all

json_print SeenAnimal.sum("count_of_times_seen")

json_print SeenAnimal.where(species: "lion").or(SeenAnimal.where(species: "tiger")).or(SeenAnimal.where(species: "bear")).sum("count_of_times_seen")


