# References

So far we have examined functional programming concepts and we have shied away from the important topic of mutation, a topic familiar to those from programming languages like Java and C.

## Structural Mutation and Variable Mutation

### Variable Mutation

Mutation simply means "changing the value of something". For instance if we have code like the following in Python:
```python
i = 0
j = i             # i = 0     j = 0
def getsum ():
    return i + j

print(getsum())
i = i + 1         # i = 1     j = 0
print(getsum())
j = j + 4         # i = 1     j = 4
print(getsum())
```

We see the value of `i` and `j` changes as the program evolves. They are still the same `i`, `j` variables, and the function `getsum` uses them. But the result of calling `getsum` depends on *when* we call `getsum`; it will use whatever value those two variables have at the time. This is known as **variable mutation**, as opposed to the *structural mutation* we will see in a little while.

Before we do that, it is important to talk about **aliasing**. Note the line `j = i`, where we have told Python to set a variable equal to another variable. Every time we do this we have to ask if we have created an "alias". Is the variable `j` from this point forward interchangeable with the variable `i`? Are they both from now on pointing to the "same value"? The answer is of course no; we can increment `i` without a corresponding change in `j`. This is in general the case with variable mutation.

### Structural Mutation

There is a slightly different kind of mutation, called structural mutation, that we are all mostly familiar with from most object-oriented programming languages. In Python a simple example of it might look as follows:
```python
class Counter():
   def __init__(self):
      self.i = 0

   def incr(self):
      self.i += 1
      return self.i

x = Counter()           # x.i = 0
y = x                   # literally the same "object" as x
print(x.incr())         # Increments both x and y
print(y.incr())         # Increments both x and y
```

In this example, we have an "object" that contains the value in its property `i`. And we can change the value that is stored there. At the same time, another variable `y` is bound to that same object `x`, and these two are now **aliased**: A change in the one object is reflected in the "other" (though there really isn't another object, they are the same object).

Those familiar with pointers know that pointers lie at the heart of the idea of aliasing. For example we could do the following in C:
```c
#include <stdio.h>
int i = 0;
int *p1, p2, p3;

int main() {
   int *p1 = &i;
   int *p2 = p1;   // p1, p2 both point to the same memory, where i is stored
   int j = *p1;
   printf("%i %i %i %i\n", i, j, *p1, *p2);
   i = i + 1;
   printf("%i %i %i %i\n", i, j, *p1, *p2);
   *p1 += 1;
   printf("%i %i %i %i\n", i, j, *p1, *p2);
   return 0;
}
```

In this example we have created the two pointers that both point to the same point in memory. When we later change the value of that point in memory, that information is reflected in all pointers that still point to that same location.

This is called **structural mutation**, because we are not really changing the value of the pointers, but instead we make adjustments to the structure the pointers are pointing to.

The essential point is that these are two subtly different kinds of mutation, and it is important to identify the difference between them. Languages like OCAML allow the latter, but not the former. We will see now how.

## References

Essentially references in OCAML are a bit like pointers, only safer and with limited power.

TODO
