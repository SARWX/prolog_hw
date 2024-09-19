% ������� 9
% ��� ⥪�⮢� 䠩�. 
% ������� ᯨ᮪ ᫮� ������� 䠩�� 
% � ��࠭��� ��� ��� ����� �������᪮� ���� ������. 
% ����������� �㭪�� �஢�ન �� �宦����� ������-���� ᫮�� � ��ନ஢���� ᯨ᮪.
DOMAINS
    word = string  % ��।������ ⨯� ��� ᫮�
    word_list = word*  % ���᮪ ᫮�

DATABASE
    word_database(word_list)  % �������᪠� ���� ������ ��� �࠭���� ᯨ᪠ ᫮�

PREDICATES
    start
    read_file(string)
    split_into_words(string, word_list)  
    save_word_list(word_list)
    word_exists(string)  
    list_member(string, word_list)  % �஢�ઠ �宦����� ᫮�� 

CLAUSES
    % ������� �㭪��
    start :-
        read_file("input.txt"),  % �⥭�� 䠩�� input.txt
        write("������ ᫮�� ��� ���᪠: "),
        readln(Word), nl,
        word_exists(Word).  % �஢�ઠ �宦����� ᫮�� � ᯨ᮪

    % �⥭�� ᮤ�ন���� 䠩��
    read_file(Filename) :-
        file_str(Filename, Content),          % �⥭�� 䠩�� ��� ��ப�
        split_into_words(Content, WordList),  % ��������� �� ᫮��
        save_word_list(WordList).             % ���࠭塞 ᯨ᮪ ᫮� � ���� ������

    % ��������� ��ப� �� ᫮��
    split_into_words("", []).  % ��� ���⮩ ��ப� ��祣� �� ������
    split_into_words(Content, [Word | RestWords]) :-
        fronttoken(Content, Word, RestContent),  % ��������� ᫮�� � ���⮪ ��ப�
        split_into_words(RestContent, RestWords).  % �������

    % ���࠭���� ᯨ᪠ ᫮� � ���������� ���� ������
    save_word_list(WordList) :-
        assert(word_database(WordList)).  % ���࠭塞 ᯨ᮪ ᫮� � ���� ������

    % �஢�ઠ, ������� �� ᫮�� � ᯨ᪥
    word_exists(Word) :-
        word_database(WordList),  % ����砥� ��࠭�� ᯨ᮪ ᫮�
        list_member(Word, WordList),  % �஢��塞, ���� �� ᫮�� � ᯨ᪥
        write("����� '", Word, "' ������� � ᯨ᪥!"), nl, !.

    word_exists(Word) :-
        write("����� '", Word, "' �� ������� � ᯨ᪥."), nl.

    % ��������� �।���� member ��� �஢�ન �宦����� ᫮�� � ᯨ᮪
    list_member(Word, [Word | _]).  % �᫨ ��ࢮ� ᫮�� ᯨ᪠ ᮢ������, � ��⨭�
    list_member(Word, [_ | RestWords]) :- 
        list_member(Word, RestWords).  % �����ᨢ�� �஢��塞 ��⠢訥�� ������ ᯨ᪠

GOAL
    start.
