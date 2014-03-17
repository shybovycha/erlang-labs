# Erlang labs

## Overview

These are solutions to the Erlang classes at ZSTU.

## Requirements

At least as well as at most, you'll need Erlang to be installed.
On Ubuntu it's simple enough: `sudo apt-get install erlang`.

## Running

Runs are performed manually, using Erlang console. For now.

First, run `erl` at the root directory, containing modules.
For instance, if you want to check the `task1.erl` module,
navigate to the directory containing that file and then,
run the `erl` CLI, write `c(task1).` and hit <kbd>Enter</kbd>.
Then you should be able to run any of the functions, described
at `task1` module. Like this: `task1:fib(10).`.

## Tasks

### Class #1

* Factorial
* Fibonacci numbers
* Permutations
* Write a function `sum/1` which, given a positive integer `N`, will return the sum of all the
    integers between 1 and N.

    **Example:**

    ```erlang
    sum(5) => 15.
    ```

    Write a function `sum/2` which, given two integers `N` and `M`, where `N =< M`, will return
    the sum of the interval between `N` and `M`. If `N > M`, you want your process to terminate
    abnormally.

    **Example:**

    ```erlang
    sum(1,3) => 6.
    sum(6,6) => 6.
    ```

* Write a function that returns a list of the format `[1,2,..,N-1,N]`.

    **Example:**

    ```erlang
    create(3) => [1,2,3].
    ```

    Write a function that returns a list of the format `[N, N-1,..,2,1]`.

    **Example:**

    ```erlang
    reverse_create(3) => [3,2,1].
    ```

* Write a function that, given a list of integers and an integer, will return all integers
    smaller than or equal to that integer.

    **Example:**

    ```erlang
    filter([1,2,3,4,5], 3) => [1,2,3].
    ```

    Write a function that, given a list, will reverse the order of the elements.

    **Example:**

    ```erlang
    reverse([1,2,3]) => [3,2,1].
    ```

    Write a function that, given a list of lists, will concatenate them.

    **Example:**

    ```erlang
    concatenate([[1,2,3], [], [4, five]]) => [1,2,3,4,five].
    ```

    **Hint:** you will have to use a help function and concatenate the lists in several steps.

    Write a function that, given a list of nested lists, will return a flat list.

    **Example:**

    ```erlang
    flatten([[1,[2,[3],[]]], [[[4]]], [5,6]]) => [1,2,3,4,5,6].
    ```

    **Hint:** use concatenate to solve flatten.

* Write the server that will wait in a receive loop until a message is sent
    to it. Depending on the message, it should either print its contents and loop again, or
    terminate. You want to hide the fact that you are dealing with a process, and access its
    services through a functional interface, which you can call from the shell.

    This functional interface, exported in the echo.erl module, will spawn the process and
    send messages to it. The function interfaces are shown here:

    ```erlang
    echo:start() => ok
    echo:print(Term) => ok
    echo:stop() => ok
    ```

    **Hint:** use the `register/2` built-in function, and test your echo server using the process manager.

    **Warning:** use an internal message protocol to avoid stopping the process when you,
    for example, call the function `echo:print(stop)`.

* Write a program that will create `N` processes connected in a ring.
    Once started, these processes will send `M` number of messages around the
    ring and then terminate gracefully when they receive a quit message. You can start the
    ring with the call `ring:start(M, N, Message)`.

    There are two basic strategies to tackling this exercise. The first one is to have a central
    process that sets up the ring and initiates sending the message. The second strategy
    consists of the new process spawning the next process in the ring. With this strategy,
    you have to find a method to connect the first process to the second process.
    Regardless of the strategy you choose, make sure you have solved this exercise with
    pen and paper before you start coding. It differs from the ones you have solved before
    because you will have many processes executing the same function in the same module
    at the same time. Furthermore, processes will be using this function to interact with
    each other. When writing your program, make sure your code has many io:format
    statements in every loop iteration. This will give you a complete overview of what is
    happening (or not happening) and should help you solve the exercise.