/* Example "load and test" file */

:- [load].
:- use_module(last_element).
:- use_module(last_but_one).
:- use_module(kth_element).
:- use_module(number_of_elements).
:- use_module(reverse_list).
:- use_module(palindrome).
:- use_module(flatten_list).
:- use_module(elim_cons_dups).
:- use_module(pack_cons_dups).
?- run_tests.
