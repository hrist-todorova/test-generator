def add_question(question, category, description, answers, options = {})
  question = Question.create(
    text: question,
    category: category,
    description: description,
    picture: options[:picture]
  )

  answers.each_slice(2).to_a.each do |x|
    add_answer(question, x[0], x[1].to_i)
  end
  question.id
end

def add_answer(question, text, correctness)
  question.answers.create(text: text, iscorrect: correctness)
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

def generate_test(questions_number, categories, variants, name, options = {})
  if categories == {}
    no_categories_test(questions_number, variants, name, options)
    return
  end

  return if questions_number != categories.each_value.to_a.inject(0, :+)

  variants.times do |i|
    test = make_variant(categories)
    variant = i + 1
    test.shuffle!
    make_pdf_file(variant.to_s, test, "#{name}-#{variant}.pdf", options)
    make_keys_pdf(variant.to_s, test, "#{name}-#{variant}-keys.pdf")
  end
end

def no_categories_test(questions_number, variants, name, options)
  test = Question.all.to_a
  variants.times do |i|
    test.shuffle!
    variant = i + 1
    f_test = test.take(questions_number)
    make_pdf_file(variant.to_s, f_test, "#{name}-#{variant}.pdf", options)
    make_keys_pdf(variant.to_s, f_test, "#{name}-#{variant}-keys.pdf")
  end
end

def make_variant(categories)
  final_test = []
  categories.each do |category, number|
    all = find_all_by_category(category).to_a
    all.shuffle!
    final_test << all.take(number)
  end
end
