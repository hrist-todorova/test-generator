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

  describe '#add_answer' do
    it 'adds asnwer to given question' do
      clear_content
      q = add_question("Color?", "", "", ["blue", 1, "cat", 0, "green", 1])
      ans = Question.find(q).answers.to_a.size
      add_answer(Question.find(q), "red", 1)
      expect(Question.find(q).answers.to_a.size).to eq ans + 1
    end
  end

  describe '#delete_question_by_text' do
    it 'deletes given question' do
      clear_content
      add_question("test", "", "", [])
      delete_question_by_text("test")
      expect(Question.where(text: "test").to_a.size).to eq 0
    end
  end

  describe '#change_question' do
    it 'changes given questions text' do
      clear_content
      q = add_question("Text1", "", "", [])
      change_question("Text1", "Text2")
      expect(Question.find(q).text).to eq "Text2"
    end
  end

  describe '#find_all_by_category' do
    it 'finds all question with given category' do
      clear_content
      add_question("", "animals", "", [])
      add_question("", "animals", "", [])
      expect(find_all_by_category("animals").to_a.size).to eq 2
      expect(find_all_by_category("plants").to_a.size).to eq 0
    end
  end

  describe '#find_all_by_description' do
    it 'finds all question with given description' do
      clear_content
      add_question("", "", "text", [])
      add_question("", "", "text", [])
      expect(find_all_by_description("text").to_a.size).to eq 2
      expect(find_all_by_description("other text").to_a.size).to eq 0
    end
  end







end
