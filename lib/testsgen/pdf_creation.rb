def make_pdf_file(test, filename, options_hash)
  pdf = Pdf.new
  test.each do |category_array|
    category_array.each do |question|
      pdf.add_question(question.text)
      answer_char = 'a'
      question.answers.to_a.each do |answer|
        pdf.add_answer("#{answer_char}) " + answer.text)
        answer_char = answer_char.succ
      end
    end
  end
  pdf.create_file(filename)
end

def make_keys_pdf(test, filename)
  #not working
  pdf = Pdf.new
  n = 1
  test.each do |category_array|
    category_array.each do |question|
      all_answers = "#{n}. "
      answer_char = 'a'
      question.answers.to_a.each do |answer|
        all_answers = all_answers + answer_char + ") " + answer.text + ", " if answer.iscorrect == 1
        answer_char = answer_char.succ
      end
      pdf.add_text(all_answers[0...(all_answers.size)])
      n += 1
    end
  end
  pdf.create_file(filename)
end
