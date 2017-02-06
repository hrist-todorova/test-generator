def make_pdf_file(test, filename, options_hash)
  pdf = Pdf.new
  test.flatten.each do |question|
    pdf.add_question(question.text)
    answer_char = 'a'
    question.answers.to_a.each do |answer|
      pdf.add_answer("#{answer_char}) " + answer.text)
      answer_char = answer_char.succ
    end
  end
  pdf.create_file(filename)
end

def make_keys_pdf(test, filename)
  pdf = Pdf.new
  test.flatten.each_with_index do |question, n|
    all_answers = "#{n}. "
      answer_char = 'a'
      question.answers.to_a.each do |answer|
        all_answers = all_answers + answer_char + ") " + answer.text + ", " if answer.iscorrect == 1
        answer_char = answer_char.succ
      end
      pdf.add_text(all_answers[0...-2])
  end
  pdf.create_file(filename)
end
