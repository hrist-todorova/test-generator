require 'prawn'

# pdf creation and methods
class Pdf
  def initialize
    @pdf = Prawn::Document.new
    @question_number = 1
  end

  def create_file(filename)
    @pdf.render_file(filename + '.pdf')
  end

  def add_header(header)
    @pdf.text(header, align: :center, size: 17)
  end

  def add_subheader(subheader)
    @pdf.text(subheader, align: :center, style: :italic, size: 13)
  end

  def add_date(date)
    @pdf.text(date, align: :center, style: :italic, size: 10)
  end

  def add_name
    @pdf.text "\n"
    @pdf.text('Name: ' + '.' * 95, align: :center)
    @pdf.text "\n"
  end

  def add_name_and_fn
    @pdf.text "\n"
    @pdf.text('Name: ' + '.' * 95 + ' ' * 6 + 'Faculty number: ' + '.' * 8,
      align: :center)
    @pdf.text "\n"
  end

  def add_text(text)
    @pdf.text text
  end

  def add_question(question, style)
    @pdf.text("#{@question_number}. #{question}", style: style)
    @question_number += 1
  end

  def add_picture(path)
    @pdf.image(path, width: 200, position: :right)
  end

  def add_answer(answer, style)
    @pdf.text(answer, indent_paragraphs: 10, style: style)
  end
end
