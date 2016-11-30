require 'sinatra'
require 'pg'
require 'sinatra/reloader'

# Number of Teams
get '/' do
  database = PG.connect(dbname: "tiy-sports")
  @data = database.exec("SELECT count(players.id), teams.name, teams.description, teams.image_url FROM players, teams, memberships WHERE players.id = memberships.player_id AND teams.id = memberships.team_id group by teams.name, teams.description, teams,image_url")
  erb :home
end
