def make_pdf_file(variant, test, filename, options_hash)
  pdf = Pdf.new
  pdf.add_header(options_hash[:subject]) if(options_hash[:subject])
  pdf.add_subheader("Variant: " + variant)
  pdf.add_date(options_hash[:date]) if(options_hash[:date])
  options_hash[:fn] == "yes" ? pdf.add_name_and_fn : pdf.add_name

  test.flatten.each do |question|
    pdf.add_question(question.text)
    pdf.add_picture(question.picture)
    answer_char = 'a'
    question.answers.to_a.each do |answer|
      pdf.add_answer("#{answer_char}) " + answer.text)
      answer_char = answer_char.succ
    end
  end
  pdf.create_file(filename)
end

def make_keys_pdf(variant, test, filename)
  pdf = Pdf.new
  pdf.add_subheader("Variant: " + variant)
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
