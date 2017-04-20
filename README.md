Data manipulation / coding challenge that a friend was given for an interview question. Thought it would be fun to attmept to implement it in a new language ([Crystal](https://crystal-lang.org/)) to give it a spin.

Original brief and requirements:

> Write a function (dollars) that accepts a `String` and returns a `String`.
> It will accept a numeric value as input, representing an amount of money, and the function will convert that value to its how it is written in English. Use any preferred programming language.
>
> For example, the input "1.11" will result in a return value of "one dollar and eleven cents"

> Invalid characters should be ignored, meaning that every input string has an output string.
> The empty string produces "zero dollars and zero cents"
>
> Some other example input and output:
>
>    > dollars "0"
>    "zero dollars and zero cents"
>
>    > dollars "1"
>    "one dollar and zero cents"
>
>    > dollars "0.1"
>    "zero dollars and ten cents"
>
>    > dollars "1."
>    "one dollar and zero cents"
>
>    > dollars "0."
>    "zero dollars and zero cents"
>
>    > dollars ".34"
>    "zero dollars and thirty-four cents"
>
>    > dollars "0.3456789"
>    "zero dollars and thirty-four cents"
>
>    > dollars "1.0"
>    "one dollar and zero cents"
>
>    > dollars "1.01"
>    "one dollar and one cent"
>
>    > dollars "1000456.13"
>    "one million four hundred and fifty-six dollars and thirteen cents"k
