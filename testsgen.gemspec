Gem::Specification.new do |s|
  s.name        = 'testsgen'
  s.version     = '0.0.0'
  s.date        = '2017-01-26'
  s.summary     = 'Tests generator'
  s.description = 'Create simple tests'
  s.authors     = ['Hristina Todorova']
  s.email       = 'hrist_todorova@abv.bg'
  s.executables << 'add_question'
  s.files       = ['lib/testsgen.rb', 'config/database.rb', 'db/schema.rb',
                    'models/question.rb', 'models/answer.rb', 'lib/testsgen/interface.rb',
                    'lib/testsgen/pdf_creation.rb']
  s.homepage    =
    'http://rubygems.org/gems/testsgen'
  s.license     = 'MIT'
end
