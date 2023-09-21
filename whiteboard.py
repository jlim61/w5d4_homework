# How to solve a problem:
    # Figure out what the input and its type are
    # Set up a function
    # Figure out what the output and its type are
    # Gather Your Knowledge
    # Gathers Your Constraints (Not always necessary) 
    # Determine a Logical way to solve the problem
        #Write each step out English
        #Write each step out in Python-esse (sudo-code)
    # Invoke and Test Your Function

    # You probably know the "like" system from Facebook and other pages.
    #People can "like" blog posts, pictures or other items. 
    #We want to create the text that should be displayed next to such an item.

    # Implement the function which takes an array containing the names of people that like an item.
    # The given array's names will always be valid, and will not contain any numbers or special characters.
    #  It must return the display text as shown in the examples:

    # []                                -->  "no one likes this"
    # ["Peter"]                         -->  "Peter likes this"
    # ["Jacob", "Alex"]                 -->  "Jacob and Alex like this"
    # ["Max", "John", "Mark"]           -->  "Max, John and Mark like this"
    # ["Alex", "Jacob", "Mark", "Max"]  -->  "Alex, Jacob and 2 others like this"
    # Note: For 4 or more names, the number in "and 2 others" simply increases.

def fb_like(alist):
    if alist == []:
        return "no one likes this"
    elif len(alist) == 1:
        return f'{alist[0]} likes this'
    elif len(alist) == 2:
        return f'{alist[0]} and {alist[1]} like this'
    elif len(alist) == 3:
        return f'{alist[0]}, {alist[1]} and {alist[2]} like this'
    else:
        return f'{alist[0]}, {alist[1]} and {len(alist) - 2} others like this'

test = []
test2 = ["Peter"]
test3 = ["Jacob", "Alex"]
test4 = ["Max", "John", "Mark"]
test5 = ["Alex", "Jacob", "Mark", "Max"]
test6 = ["Alex", "Jacob", "Mark", "Max", "Dave"]

print(fb_like(test))
print(fb_like(test2))
print(fb_like(test3))
print(fb_like(test4))
print(fb_like(test5))
print(fb_like(test6))