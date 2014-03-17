-module(task1).
-compile(export_all).

% factorial
fact(0) -> 1;
fact(N) when N > 0 -> N * fact(N - 1).

% Числа Фібоначчі.
% Варіант №1: через визначення рекурсивної функції.

%fib(0) -> 1;
%fib(1) -> 1;
%fib(N) -> fib(N - 1) + fib(N - 2).

% Варіант №2: через списки. Дана функція повертає список чисел Фібоначчі замість N-ного числа.
fib_list(0) -> [1];
fib_list(1) -> [1, 1];
fib_list(N) ->
    [ A, B | Tail ] = fib_list(N - 1),
    [A + B, A, B | Tail].

fib(N) -> hd(fib_list(N)).

% Задача 3-1-1: знайти суму перших N натуральних чисел
sum(1) -> 1;
sum(N) -> N + sum(N - 1).

% Задача 3-1-2: знайти суму чисел між N та M
sum(N, M) ->
    if
        N == M -> N;
        N < M -> M + sum(N, M - 1)
    end.

% Задача 3-2-1: створити список з N чисел
create(1) -> [1];
create(N) -> create(N - 1) ++ [N].

% Задача 3-2-2: створити реверсну версію списку з N чисел
reverse_create(1) -> [1];
reverse_create(N) -> [ N | reverse_create(N - 1) ].

% Задача 3-5-1: фільтрування списку
filter([ H | Tail ], N) ->
    if
        H =< N -> [ H ] ++ filter(Tail, N);
        true -> []
    end.

% Задача 3-5-2: реверс списку
reverse([]) -> [];
reverse([ H | Tail ]) ->
    reverse(Tail) ++ [ H ].

% Задача 3-5-3: конкатенація списків
concatenate([]) -> [];
concatenate([ H | Tail ]) ->
    H ++ concatenate(Tail).

% Задача 3-5-4: flatten =3
flatten([]) -> [];
flatten([ H | Tail ]) ->
    if
        is_list(H) -> flatten(H) ++ flatten(Tail);
        true -> [ H ] ++ flatten(Tail)
    end.
