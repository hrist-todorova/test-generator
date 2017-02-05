require 'rubygems'
require 'active_record'
require 'sqlite3'
require 'prawn'

require_relative '../config/database.rb'
#require_relative '../config/schema.rb'

require_relative '../models/question.rb'
require_relative '../models/answer.rb'

require_relative './testsgen/interface.rb'
require_relative './testsgen/pdf_class.rb'
require_relative './testsgen/pdf_creation.rb'
