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

class Questions
	attr_accessor :questions, :answers
	def initialize(q_arr, a_arr)
		@questions = q_arr
		@answers = a_arr
	end
	def pick_random
		q_arr_length = @questions.size
		rand_pick = rand(q_arr_length)
		@questions.delete(@questions.index(rand_pick))
		@questions[rand_pick]
	end
end

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
	p @records
	erb :leaderboard
end

