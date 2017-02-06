def add_question(question, category, description, answer_array = [])
  question = Question.create(
    :text => "#{question}",
    :category => "#{category}",
    :description => "#{description}",
    )
  answer_array.each_slice(2).to_a.each { |x| add_answer(question, x[0], x[1].to_i) }
  question
end

def add_answer(question, text, correctness)
  question.answers.create(:text => text, :iscorrect => correctness)
end

def delete_question_by_text(question)
  question = Question.find_by_text(question)
  Answer.where(question_id: question.id).delete_all
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

def generate_test(questions_number, categories_hash, variants, name, options)
  return if questions_number != categories_hash.each_value.to_a.inject(0, :+)

  variants.times do |i|
    final_test = []
    categories_hash.each do |category, number|
      all = find_all_by_category(category).to_a
      all.shuffle!
      final_test << all.take(number)
    end
    variant = i + 1
    make_pdf_file(final_test, "#{name}-#{variant}.pdf", options)
    make_keys_pdf(final_test, "#{name}-#{variant}-keys.pdf")
  end
end


