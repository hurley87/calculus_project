require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

class Record
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :time, Float
end

DataMapper.finalize
DataMapper.auto_upgrade!

file = File.open("questions.txt").read
q_arr = []
a_arr = []
count = 1
file.each_line do |line|
	count += 1
	q_arr << line.gsub("\n", "") if count % 2 == 0
	a_arr << line.gsub("\n", "") if count % 2 != 0
end


get '/' do
	@questions = q_arr
	@answers = a_arr
	@records = Record.all
  erb :calculus
end

post '/' do
	@record = Record.create(
			:time => params[:time],
			:name => params[:name]
		)
		redirect to('/leaderboard')
end
# database - record user and time

get "/leaderboard" do
	@records = Record.all
	erb :leaderboard
end

