# Setting OCAML up

## Installing utop

Our labs already have OCAML up. But the default interface is not particularly easy to work with. There is another environment called `utop` that makes things a little bit easier. To install it, execute the following lines in a terminal window:

```
opam init --dot-profile=~/.bashrc
opam install utop
```

After these two run, you will be able to start an interactive OCAML session by typing `utop` at the shell prompt.

## Working with files

While typing things directly in the utop interpreter is convenient at times, you should get in the habit of using files and then loading those files in. OCAML files use the `.ml` extension. Sublime Text should automatically set itself in "OCAML mode" when you save a file with that extension. It will then color you code appropriately.

When you want to "run" your file in OCAML, go to the terminal window, start an OCAML session via `utop`, and type:

```
#use "yourfile.ml";;
```

This will load and execute all lines in that file as if you had typed them directly, and it will print you a listing of created bindings and their types, in output that looks like this:
```
val f : int -> int = <fun>
```
