require "prawn"

class Pdf
  def initialize
    @pdf = Prawn::Document.new
    @question_number = 1
  end

  def create_file(filename)
    @pdf.render_file(filename + ".pdf")
  end

  def add_header(header)
    @pdf.text header, :align => :center
  end

  def add_subheader(subheader)
    @pdf.text subheader, :align => :center, :style => :italic
  end

  def add_date(date)
    #to make small
    @pdf.text date, :align => :center, :style => :italic
  end

  def add_text(text)
    @pdf.text text
  end

  def add_question(question)
    @pdf.text("#{@question_number}. #{question}")
    @question_number += 1
  end

  def add_answer(answer)
   @pdf.text answer, :indent_paragraphs => 10
  end
end
