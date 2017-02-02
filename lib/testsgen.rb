require 'rubygems'
require 'active_record'
require 'sqlite3'

require_relative '../config/database.rb'
require_relative '../db/schema.rb'
require_relative '../models/question.rb'
require_relative '../models/answer.rb'

def add_question(category, question, description, answers_array = [])
  question = Question.create(:category => "#{category}", :text => "#{question}",
    :description => "#{description}")
  answers_array.each { |x| add_answer(question, x[0], x[1]) }
end

def add_answer(question, text, correctness)
  question.answers.create(:text => text, :iscorrect => correctness)
end

def delete_question_by_text(question)
  question = Question.find_by_text(question)
  question.destroy
end

def change_question(old_question, new_question)
  question = Question.find_by_text(old_question)
  question.update_attribute(:text, new_question)
end

def find_all_by_category(category)
  Question.where(category: category)
end

def find_all_by_description(description)
  Question.where(description: description)
end
