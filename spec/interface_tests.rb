require 'rubygems'
require 'active_record'
require 'sqlite3'

require_relative '../models/question.rb'
require_relative '../models/answer.rb'

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "testdb.sqlite3"
)

RSpec.describe 'User Interaction' do
  describe '#add_question' do
    context 'adds question to the database' do

      clear_content
      q = "Who's a good boy?"
      add_question(q, "dogs", "Dog question", ["This dog", 1, "That dog", 0])

      it 'adds correct question' do
        expect(Question.first.text).to eq q
      end

      it 'adds correct category' do
        expect(Question.where(category: "dogs").to_a.size).to eq 1
      end

      it 'adds correct description' do
        expect(Question.where(description: "Dog question").to_a.size).to eq 1
      end

      it 'adds all answers' do
        expect(Question.first.answers.size).to eq 2
      end
    end
  end
end
