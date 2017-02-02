require 'rubygems'
require 'active_record'
require 'sqlite3'

require_relative '../config/database.rb'
require_relative '../db/schema.rb'
require_relative '../models/question.rb'

def add_question(category = nil, question = nil, description = nil)
  q = Question.create(:category => "#{category}", :text => "#{question}",
    :description => "#{description}")
end


add_question("papa", "papa", "papa")
