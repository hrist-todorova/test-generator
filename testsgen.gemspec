Gem::Specification.new do |s|
  s.name        = 'testsgen'
  s.version     = '0.0.0'
  s.date        = '2017-01-26'
  s.summary     = 'Tests generator'
  s.description = 'Create simple tests'
  s.authors     = ['Hristina Todorova']
  s.email       = 'hrist_todorova@abv.bg'
  s.executables << 'add_question' << 'change_question' << 'clear_content' << 'delete_question_by_text' << 'find_all_by_category' << 'find_all_by_description'


  s.files       = ['config/database.rb', 'config/schema.rb.rb', 'config/data.sqlite3',
                   'lib/testsgen.rb', 'lib/testsgen/interface.rb',
                   'lib/testsgen/pdf_class.rb', 'lib/testsgen/pdf_creation.rb',
                   'models/question.rb', 'models/answer.rb', 'spec/interface_tests.rb',
                   'spec/testdb.rb',
                 ]
  s.homepage    = 'http://rubygems.org/gems/testsgen'
  s.license     = 'MIT'
end
