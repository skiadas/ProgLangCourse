# Assignment 9

Introduction to Racket

This assignment serves as an introduction to basic Racket features. You will find detailed instructions in the file: `https://github.com/skiadas/ProgLangAssignments/blob/master/assignment9sub.rkt`

You are not allowed to use any of the mutation features in Racket. But you may otherwise use Racket features we may not have talked about. There are really few instances where this should be needed, though. For the most part we have covered all that you will need for this assignment.

Correctness of the solutions, including whether the code loads, will count for 15 points. Your code MUST load with no errors and have the correct types. You should make sure that the compile steps described in the README in the assignment file work out without problems.

Style-wise, pay particular attention to the names you use for your variables, and to the appropriate vertical-aligning of related items.

Another 5 points will come from style issues, your tests and use of GitHub, including Milestones and Labels, issues and closing those issues via commits. Keep creating issues for the various parts of the assignment. assigining them to milestones and tagging them with labels. **Create new milestones for each assignment**.

1. You already have created a link to the instructor's remote repository. You need to download the updated version of the instructor's repository and merge the changes into yours. The following should do that:
    - Type: `git fetch instr`
    - Type: `git merge master instr/master`. This may give you a editor window to edit a commit message. You don't need to edit it, just "save" (writeOut) and exit/close the document. (This is probably not your prefered editor. See [this page](https://help.github.com/articles/associating-text-editors-with-git/) for how to set up your favorite editor for use in these merge situations. I would recommend setting it to SublimeText).
    - If it reports no problems, you're ready.
    - If it reports merge conflicts, you will need to resolve those first, then make a commit. [this page](https://help.github.com/articles/resolving-a-merge-conflict-from-the-command-line/) has some instructions on how to do that. Or contact me.
2. Create new milestones for components of this assignment as described in the assignment's documentation file.
3. Throughout your work, create and close issues via commits as described in the instructions above and in previous homeworks. Make sure to assign each issue to the correct milestone and to give them the correct labels.
4. There are two files that you need to work with: `assignment9sub.rkt` contains the source code, while `assignment9tests.rkt` contains the tests.
