# Assignment 6

Streams

In this assignment you will continue using the GitHub features we have seen so far, get more used to currying, anonymous functions and type variants, as we explore *streams*.

A **stream** is essentially an infinite list that produces its elements one at a time, upon request. In functional programming these streams are often implemented as a thunk, i.e. an anonymous function, that when called produces a pair of the next value as well as the stream to call to continue getting values.

We really want to be thinking of streams as infinite lists, so we should be able to do all the various operations we can do for "normal" lists, like map, filter, zip, accumulating (folds) and so on. In the tests you will see two interesting applications of this process: One creates a stream that produces all [Pythagorean triples](https://en.wikipedia.org/wiki/Pythagorean_triple), the other verifies that any time you add the odd numbers 1 + 3 + 5 + ... + (2n+1) you get as a result a perfect square.

As before, you should NOT specify the types of your functions, but rather let the system figure it all out. This may make the resulting types appear different than what is required, you should make sure that they are indeed the same and that the only difference is because of type aliases. In some cases the system might derive a "more general type" than the expected one, and that is OK.

As in prior assignments, you should not use any functions we have not learned about unless explicitly told to. These assignments are not about learning a number of library functions, but about delving deeply into fundamental building blocks of programming.

Correctness of the solutions, including the types and whether the code loads, will count for 15 points. Your code MUST load with no errors and have the correct types. Otherwise you will receive 0 for correctness even if most of your functions are correct.

Another 5 points will come from style issues, your tests and use of GitHub, including Milestones and Labels, issues and closing those issues via commits. Keep creating issues for the various parts of the assignment. assigining them to milestones and tagging them with labels. **Create new milestones for each assignment**.

1. You already have created a link to the instructor's remote repository. You need to download the updated version of the instructor's repository and merge the changes into yours. The following should do that:
    - Type: `git fetch instr`
    - Type: `git merge master instr/master`. This may give you a editor window to edit a commit message. You don't need to edit it, just "save" (writeOut) and exit/close the document. (This is probably not your prefered editor. See [this page](https://help.github.com/articles/associating-text-editors-with-git/) for how to set up your favorite editor for use in these merge situations. I would recommend setting it to SublimeText).
    - If it reports no problems, you're ready.
    - If it reports merge conflicts, you will need to resolve those first, then make a commit. [this page](https://help.github.com/articles/resolving-a-merge-conflict-from-the-command-line/) has some instructions on how to do that. Or contact me.
2. Create a new milestone for this assignment.
3. Throughout your work, create and close issues via commits as described in the instructions above and in previous homeworks. Make sure to assign each issue to the correct milestone and to give them the correct labels.
4. You will find two files in this directory:
    - `assignment6sub.ml` This is the main submission file. It is where you will add your code for the various functions that you need to write. There are comments in that file to show you where to add your function definitions, and to tell you what your functions should do.
    - `assignment6tests.ml` This is a file with a small number of tests, and you should add plenty tests your own. "Tests" are arranged as lines `let ... = e` where `e` is a an expression that is meant to evaluate to a boolean indicating if the tests succeeded or not.
5. To "run" your tests, start an OCAML session in the terminal via `utop`, do:
```
#use "assignment6sub.ml";;
#use "assignment6tests.ml";;
```
