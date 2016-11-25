#!/usr/bin/env python
import fileinput

# This class defines all the states our Automata has.

class State:
    q1 = 1
    q2 = 2
    q3 = 3
    q4 = 4
    q5 = 5


# This function defines the moves in the automata depending on each state we are
# and wich character we recieve.

def step(stat,char):
    if stat == State.q1:
        if char == 'a':
            return State.q2
        elif char == 'b':
            return State.q4
    elif stat == State.q2:
        if char == 'a':
            return State.q2
        elif char == 'b':
            return State.q3
    elif stat == State.q3:
        if char == 'a':
            return State.q2
        elif char == 'b':
            return State.q3
    elif stat == State.q4:
        if char == 'a':
            return State.q5
        elif char == 'b':
            return State.q4
    elif stat == State.q5:
        if char == 'a':
            return State.q5
        elif char == 'b':
            return State.q4

# Reading the input
word = raw_input("Write your word of the \"ab\" Alphabet: ")

# Defining the initial state
stat = State.q1

# For each character, we apply the move in the automata.
for char in word:
    stat = step(stat,char)

''' We display that the word matches. Our final states are q1(the empty word is in our language),
q3 and q5.
'''
if stat == State.q1 or stat == State.q3 or stat == State.q5:
    print "Your word matches"
else:
    print "Your word does not matches"
