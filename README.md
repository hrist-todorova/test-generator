# Генератор на тестове

##Документация

`add_question(question, category, description, answers, options = {})` - добавяме въпрос като първо задаваме съответно
* текст на въпроса
* неговата категория
* негово описание
* въпросите му в следния вид : ["отговор1", 0, "отговор2", 1] - след всеки отговор задаваме дали той е верен или не съответно с 1 или 0
* възможно е като последен параметър за зададем хеш с опцията за картинка : {picture: "path"}

`delete_question_by_text(question)` - изтриваме въпрос като подадем като параметър текстът му

`change_question(old_question, new_question)` - заменяме текстът на въпрос с друг

`find_all_by_category(category)` - намираме всички въпроси от зададената като параметър категория

`find_all_by_description(description)` - намираме всички въпроси по зададеното описание

`clear_content` - изчистваме цялата база данни

`generate_test(questions_number, categories, variants, name, options = {})` - генерираме тестове задавайки следните параметри
* questions_number - по колко въпроса искаме да съдържат тестовете
* categories - хеш с категории указващ по колко въпроса желаем от всяка категория например {music: 2, history: 5}
* колко варианта искаме да създадем
* общо име на тестовете
* хеш от опции като те могат да бъдат следните (може и без тях):
-- :subject - тук задаваме какво да е заглавието на теста например "Тест по тестване на тестването"
-- :date - дата на теста
-- :fn - аргументът трябва да е "yes", ако искаме до името да има поле за факултетен номер
-- :question_style - форматиране на въпросите например :bold, :italic
-- :answer_style - форматиране на отговорите

##Стартиране на executable под Windows

`cd lib`
`ruby ../bin/your_command аргументи`

##Стартиране на тест

В папката spec:
`rspec interface_tests.rb -r ../lib/testsgen.rb -c -f doc`

!!! add_question не приема хеш с опции
!!! generate_test има вида generate_test(questions_number, variants, name)
