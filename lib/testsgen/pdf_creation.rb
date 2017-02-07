def make_pdf_file(variant, test, filename, options_hash)
  pdf = Pdf.new
  pdf.add_header(options_hash[:subject]) if options_hash[:subject]
  pdf.add_subheader('Variant: ' + variant)
  pdf.add_date(options_hash[:date]) if options_hash[:date]
  options_hash[:fn] == 'yes' ? pdf.add_name_and_fn : pdf.add_name

  test.flatten.each do |question|
    print_questions_and_answers(pdf, question, options_hash)
  end
  pdf.create_file(filename)
end

def print_questions_and_answers(pdf, question, options)
  pdf.add_question(question.text, options[:question_style])
  pdf.add_picture(question.picture) if question.picture != nil
  answer_char = 'a'
  question.answers.to_a.each do |answer|
    pdf.add_answer("#{answer_char}) " + answer.text, options[:answer_style])
    answer_char = answer_char.succ
  end
end

def make_keys_pdf(variant, test, filename)
  pdf = Pdf.new
  pdf.add_subheader('Variant: ' + variant)
  test.flatten.each_with_index do |question, n|
    all_answers = print_correct_answers(question, n + 1)
    pdf.add_text(all_answers[0...-2])
  end
  pdf.create_file(filename)
end

def print_correct_answers(question, n)
  all_answers = "#{n}. "
  answer_char = 'a'
  question.answers.to_a.each do |answer|
    if answer.iscorrect == 1
      all_answers = all_answers + answer_char + ') ' + answer.text + ', '
    end
    answer_char = answer_char.succ
  end
  all_answers
end
