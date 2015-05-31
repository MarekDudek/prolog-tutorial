/* Example "load and test" file */

:- [load].
:- use_module(last_element).
:- use_module(last_but_one).
:- use_module(kth_element).
:- use_module(number_of_elements).
:- use_module(reverse_list).
:- use_module(palindrome).
:- use_module(flatten_list).
?- run_tests.
