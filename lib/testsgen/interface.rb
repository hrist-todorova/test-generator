def add_question(question, category = nil, description = nil, answer_array)
  question = Question.create(
    :text => "#{question}",
    :category => "#{category}",
    :description => "#{description}",
    )
  answer_array.each_slice(2).to_a.each { |x| add_answer(question, x[0], x[1]) }
  question
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

def clear_content
  Answer.delete_all
  Question.delete_all
end

def generate_test(questions_number, categories_hash, variants, name)
  #to chech if in categories we want more than we need


  variants.times do
    final_test = []
    categories_hash.each do |category, number|
  #test this !!!!!
      all = find_all_by_category(category).to_a
      all.shuffle!
      final_test << all.take(number)
    end
    make_pdf_file(final_test, "#{name}.pdf")
    make_keys_pdf(final_test, "#{name}-keys.pdf")
  end
end


