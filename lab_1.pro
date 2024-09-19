% ВАРИАНТ 9
% Дан текстовый файл. 
% Создать список слов данного файла 
% и сохранить его как элемент динамической базы данных. 
% Реализовать функцию проверки на вхождение какого-либо слова в сформированный список.
DOMAINS
    word = string  % Определение типа для слов
    word_list = word*  % Список слов

DATABASE
    word_database(word_list)  % Динамическая база данных для хранения списка слов

PREDICATES
    start
    read_file(string)
    split_into_words(string, word_list)  
    save_word_list(word_list)
    word_exists(string)  
    list_member(string, word_list)  % Проверка вхождения слова 

CLAUSES
    % Главная функция
    start :-
        read_file("input.txt"),  % Чтение файла input.txt
        write("Введите слово для поиска: "),
        readln(Word), nl,
        word_exists(Word).  % Проверка вхождения слова в список

    % Чтение содержимого файла
    read_file(Filename) :-
        file_str(Filename, Content),          % Чтение файла как строки
        split_into_words(Content, WordList),  % Разбиваем на слова
        save_word_list(WordList).             % Сохраняем список слов в базу данных

    % Разбиение строки на слова
    split_into_words("", []).  % Для пустой строки ничего не делать
    split_into_words(Content, [Word | RestWords]) :-
        fronttoken(Content, Word, RestContent),  % Извлекаем слово и остаток строки
        split_into_words(RestContent, RestWords).  % Рекурсия

    % Сохранение списка слов в динамическую базу данных
    save_word_list(WordList) :-
        assert(word_database(WordList)).  % Сохраняем список слов в базе данных

    % Проверка, существует ли слово в списке
    word_exists(Word) :-
        word_database(WordList),  % Получаем сохранённый список слов
        list_member(Word, WordList),  % Проверяем, есть ли слово в списке
        write("Слово '", Word, "' найдено в списке!"), nl, !.

    word_exists(Word) :-
        write("Слово '", Word, "' не найдено в списке."), nl.

    % Реализация предиката member для проверки вхождения слова в список
    list_member(Word, [Word | _]).  % Если первое слово списка совпадает, то истина
    list_member(Word, [_ | RestWords]) :- 
        list_member(Word, RestWords).  % Рекурсивно проверяем оставшиеся элементы списка

GOAL
    start.
