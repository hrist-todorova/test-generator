# Генератор на тестове

##Документация

`add_question(category, question, description, answers_array)` - добавяме въпрос като първо задаваме неговата категория, след това текстът на въпроса, негово описание и масив с възможни отговори.
Всеки елемент на масива е двуелементен масив чиито първи елемент е текстът на отговора, а вторият е 0 или 1:
* 1 - ако отговорът е верен
* 0 - ако отговорът е грешен

`change_question(old_question, new_question)` - заменяме текстът на въпрос с друг

`find_all_by_category(category)` - намираме всички въпроси от зададената като параметър категория

`find_all_by_description(description)` - намираме всички въпроси по зададеното описание


##Стартиране на executable под Windows

`ruby ../bin/your_command аргументи`

##Стартиране на тест

В папката spec:
`rspec interface_tests.rb -r ../lib/testsgen.rb -c -f doc`
