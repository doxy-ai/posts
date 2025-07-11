+++
date = '2025-07-09T17:50:57-07:00'
# draft = true
title = 'Learn C++ (for Games) in One Stream'
keywords = ["Game Dev in One Stream"]
summary = "AI is going to guide us through a lightning-fast ‘How to Learn C++ in One Stream.' The goal is to cover everything important in about an hour. So, let's make a bet—do you think I'll actually meet that goal? We'll start the timer at 6:00 PM, and if I'm not done by 7:00, you'll have the pleasure of laughing at me and calling me a nerd. Sound good?"
+++

{{<rawhtml>}}
<iframe width="560" height="315" src="https://www.youtube.com/embed/56ULVXIlorw?si=V2yQv4Q5ddbmK1MP" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
{{</rawhtml>}}

AI is going to guide us through a lightning-fast ‘How to Learn C++ in One Stream.'

We're going to start super basic—so basic that we're going to open up a web browser and install Visual Studio.
Next, we're going to grab its little brother: Visual Studio Code. We'll download that as well to set up a decent development environment. There is a checkbox we should ticked when installing Visual Studio Code that allows us to open it directly from the right-click context menu, but otherwise just click through the installer.

Now, we wait for the big installer to kick in. When it does, make sure to select the option for "Desktop Development with C++" and install all the necessary components. So, what just happened? Well, AI just clicked a bunch of buttons and started installing a ton of things. What are they?

Well, first, we installed Visual Studio. But what is that, exactly? Visual Studio is what's known as a compiler. The job of a compiler is to take the code we write (which we're going to spend most of this session working on) and convert it into machine code.

Code is something humans like to read, while machine code is optimized for AI (or, more accurately, for computers). So, for example, a piece of code like std::cout << "Hello, World"; could be converted into something like 01110100011001010010010000001100. That's machine code! It's optimized for the computer to process quickly. Meanwhile, source code is optimized for humans to read and understand.

Visual Studio's job is to take the human-readable version of the code and turn it into the machine-readable version.

Next, we installed Visual Studio Code. This is just a fancy text editor. We're going to install a few extra things in it to make our lives easier when editing code, but at its core, it's just a text editor. Very fun, right?

Finally, we installed CMake (when we checked Desktop Development with C++). CMake helps us tell the compiler what to do. Instead of issuing a bunch of commands to the compiler, CMake lets us write a short file that tells the compiler exactly what it needs to do.

Now that we have a basic understanding of the tools we've just set up, let's dive into the code!

Now, let's head over to the button at the bottom of Visual Studio Code that says 'Insert Extensions.' We're going to search for 'Edwin.' This will bring up a big list of options, and we're going to find the 'Edwin C++' extension and install all the C++ extensions that pop up. It'll take a moment for them to install.

Once they're done, we're going to restart Visual Studio Code. Now, we should be able to go to our 'Documents' folder (or wherever you prefer) and create a new folder named `cpp_in_one_stream`. This is where we'll store all the code for today's session. Right click the folder and select Open with Code.

We can also do it the slightly harder way. We'll open the terminal and just type code . to launch Visual Studio Code in the current folder.

## Hello World

To get started, let's create the simplest C++ file ever. I'll call it main.cpp. This will be our first C++ program: every programmer's first 'Hello, World.' The code looks like this:

```cpp
#include <iostream>
int main() {
    std::cout << "Hello, World" << std::endl;
    return 0;
}
```

This program includes the standard library for input and output streams (`<iostream>`) and uses the `std::cout` (standard console output) stream to print the message 'Hello, World' to the console, followed by a newline (*end l*ine).

After that, we'll notice some messages pop up at the bottom of the screen. We'll follow them to disable builtin IntelliSense, and then it'll ask us to reload the environment. After reloading, we'll create the CMake script to build this simple file.

To do that, we'll create a file called `CMakeLists.txt`, which is required for setting up the build process.

We need to specify the minimum version of CMake that we want to use. So, we'll start by adding the line:

```cmake
cmake_minimum_required(VERSION 3.21)
```

This sets the minimum required version to 3.21. If you request a version that's too old, CMake will complain. On the other hand, if you ask for a version that's too new, it might not be compatible with some computers. For 2025, 3.21 is a solid choice.

Next, we'll add the command to create an executable:

```cmake
add_executable(main main.cpp)
```

We'll name it main, and it will take the main.cpp file as input. This little script will tell the compiler, "Hey, we're using this specific version of CMake, and we're going to build an executable called 'main.'"

After doing that, Visual Studio will recognize that it's installed, and we'll see an option to select what's called a "kit." The kit lets us choose which version of Visual Studio we want to use for compilation—or more accurately, which version we'll target with Visual Studio.

The x86 option isn't really used anymore. That's for older 32-bit computers. Pretty much every computer these days is 64-bit, so we'll choose either the 64-bit or 64-bit/32-bit version. In this case, we'll pick amd64.

This will automatically gather all the information about the compiler for us, but it may take a little while since the installation process is still finishing up.

Once everything is set up, without any issues, we can click the little "run" (play) button down at the bottom. And just like that, we've successfully created our first program! We've printed "Hello, World" to the console.

This program is still pretty basic—just printing "Hello, World." Maybe we can make it a bit more interesting. For example, let's print a personalized greeting for someone named Russell.

We'll create a variable called `name` and set it equal to "Russell."

```cpp
auto name = "Russell";
```

Then, instead of printing `std::cout << "Hello World << std::endl;` we'll print `std::cout << "Hello << name << std::endl;`

Any guesses on what this will output when we run it?

Now, when we run the program and we've successfully printed "Hello, Russell" to the console.

## Debugging

Here's something interesting: if we hover over to the left side of the screen, we'll see an option to add a breakpoint (red circle). If we click that, instead of clicking the play button to run the program, we'll click the "bug" button next to it to start debugging.

When we debug, instead of running the entire program at once, it will step through the code line by line. For example, we can press the "step" button to execute one line of code, then move to the next, and so on. **This is how the computer works as well... stepping from line to line in exactly the same way**. As we're stepping through, we can observe the values of variables like name—which will show as "Russell" along with some large number that we'll discuss later. Then, as we step over the next line, we'll see "Hello, Russell" being printed. Cool, right?

## Functions

Now, the most important concept to understand here is the idea of a function. So, what exactly is a function? A function is a piece of code that can be reused multiple times. We already have one function: the `main` function which the compile searches for and uses as the start of the program.

Let's create a simple function called `add`. It takes two values, `a` and `b`, and returns their sum:

```cpp
int add(int a, int b) {
    return a + b;
}
```

We'll discuss what `int` means in a moment. But for now, if we replace "Russell" with the function call `add(5, 6)`, when we run the program, it will give us an error. The error will probably say something like "add function doesn't exist," or "identifier undeclared" because we haven't defined the function yet. C++ is only aware of things created before they are used... so if we created the add function after main the compiler will complain.

To fix that, all we need to do is write the add function before we use it in the program. Once we do that, the program should no longer complain about the add function not existing, and it will print out the number "11."

So, what happened here? The return statement basically means "end the function and give back a value." The function replaces itself with the value it returns. In this case, we're returning the sum of `a` and `b`. The compiler goes in, does the math, and inserts the value in place of the function call.

The values of `a` and `b` are 5 and 6, so the function computes 5 + 6, which equals 11. If we step through the program using the debugger (using step into to go into the function instead of the standard step to simply go to the next line), we can see this process in action. When we use the "step" function instead of the "step over" function, the debugger jumps into the add function, does the calculation, and then returns 11, which is then printed out.

## Types

Now, the obvious question at this point is: What's an `int`?

In programming, we use several main data types to store different kinds of data. One of these is `int`, which stands for integer. But what exactly does an integer look like? An integer is any number without a decimal point. These can be positive or negative whole numbers, like: -1, 0, 1, 2, 3

A couple of things to notice here:
- Integers can be negative.
- There are no decimal numbers like 5.5 or 3.14.

If we want numbers that do have decimal points, we use a different data type called `float`. A `float` (short for floating-point number) allows us to store numbers with decimals, like: 1.0, 5.5, 1277.8
These numbers can have fractional parts, unlike integers.

`bool` named after an old world logician named George Bool is like an `int` but it only stores two values `true` and `false`... 1 and 0.

There are also other types we can use besides just numbers. For example, we can use `std::string` to store text, like "Russell." A string is essentially a collection of characters all grouped together.

Let's take a look at another interesting concept: variables. We've already seen one in action. A variable is something that has a value and a name. For example, we created a variable called `name` earlier, and that variable can have values assigned to it.

> On your own: Write a program with at least three functions. These could be basic math functions like add(), subtract(), and multiply(). The program should ask the user for two numbers and then give the user the option to choose which operation they want to perform.
>
> Steps:
>
> - Define each function to perform a different arithmetic operation (e.g., int subtract(int a, int b)).
> - Ask the user to input two numbers (you can use `std::cin >> some_int_variable_you_make`).
> - Present the user with a menu to choose which operation they want to perform.
> - Call the appropriate function based on the user's choice and print the result.

## Looping and Arrays

Now, let's make a new variable. We'll use `auto` to let the compiler figure out the type for us, and we'll call this new variable `names`. The value of `names` will be an array of strings (`std::array<std::string, 2>`). As we saw earlier, `std::string` is a data type for text, which can be a collection of characters. In this case, we'll have an array with two strings.

```cpp
auto names = std::array<std::string, 2>{"Russell", "DJ"};
```

What does it mean to have an array of two strings? It means we can store two pieces of text in this variable. For example, we could store "Russell" and "DJ" in the `names` array. Now, to access those values, we use the array index notation.

To get the first string, we use `names[0]`, and to get the second one, we use `names[1]`. Why do we start counting from zero? That might seem a little strange at first, but it's because of how arrays are structured in memory. Arrays are indexed from zero, so the first element is at position zero, the second at position one, and so on.

Behind the scenes, when we access an array element like names[0], it's performing some math to figure out where the data is stored. So, when we say names[0], it's adding 0 to names (`names + 0`), and logically then `names + 1` is the second one.

Now, if we try to compile the code without including the right header for arrays (`#include <array>`), it will give us an error, saying that it doesn't know what an array is. To fix that, we need to include the appropriate header for arrays.

Once we've set everything up correctly, running the program with `names[0]` instead of `name` print "Russell" (the first element in the array). If we print out names[1], it will give us "DJ" (the second element).

But what if we want to print out both of these names? We can use a `for` loop for that. Here's how we'd write it:

```cpp
for (auto name : names)
    std::cout << "Hello " << name << std::endl;
```

Now, instead of printing out a specific index, we're iterating over the entire array. The syntax `for(auto name : names)` means "for each name in the names array, assign it to the variable name, and then execute the code inside the loop."

Notice how I used the word `auto` here. What does `auto` mean? Well, earlier we talked about data types like `int` and `float`. The keyword `auto` tells the compiler, "You figure out the type for me." Instead of typing out the full data type of names, like `std::array<std::string, 2>`, we can just use `auto` to let the compiler determine it automatically.

Similarly, we could explicitly specify the type of name as `std::string`, but typing `auto` is much shorter and easier (but a little bit more likely to produce bugs).

### For Loops

Instead of simply looping over each item in an array, we can write a loop that runs some custom logic based on a list of numbers. Let's create a new variable called `index` and set it to 0. This is where our array starts. Then, we'll set up a loop that continues as long as `index` is less than the size of the `names` array. To do this, we'll ask the array `names` for its size and use that as our stopping condition.

```cpp
for(int index = 0; index < names.size(); index = index + 1)
```

If we wanted to be a bit more specific, we could manually set the stopping condition to `< 2` but that would break the program if we resized the array later. To prevent that, we'll use `names.size()` instead of hardcoding the value.

After each loop iteration, we'll increase index by 1, using the statement `index = index + 1`. What's happening here is that we're performing some computation (in this case, increasing the value of index) and storing the result in the index variable. This works a little differently from math since a variable can be updated by referring to its itself (it simply means variable on the left now has value on the right).

At the beginning, `index` starts at 0. After the first iteration, we add 1 to `index`, so it becomes 1. The next time the loop runs, it's 1, and after adding 1, it becomes 2. This is a very logical way of updating the value step by step.

Now, if we run this program, it should give us an error because we've changed how we're accessing the elements. Previously, we used name, but now we need to reference the array with `names[index]`. So `names[0]`, `names[1]`, and so on... After this fix, the program should print the same result as before, but we can now see how index changes each time.

```cpp
for(int index = 0; index < names.size(); index = index + 1)
    std::cout << "Hello "  << names[index] << std::endl;
```

If we run the program through the debugger and step through it, we'll see that on the first pass, index is 0. The value is printed, and then index is incremented to 1, printed again, and so on.

To help clarify, I'm going to add a comment. Comments are lines of code that the compiler ignores, but they help humans understand the code. Here's how we add a comment:

```cpp
// This is a comment.
```

Now, let's dive into the structure of the for loop. A for loop has three parts:
+ Start: The initialization part, where we create variables like `index = 0`.
+ Check: The condition part, which checks if the loop should continue (like `index < names.size()`).
+ Update: The step part, which happens after each run through the loop (like `index = index + 1`).

```cpp
// for(<start part>; <check part>; <update part>)
```

So, when the loop runs, it starts by executing the start. Then, it checks if the condition is true. If it is, it enters the loop body, performs the code inside, and then moves to the update part before checking the condition again.

For example, is 0 less than 2? Yes, so the loop continues. Is 1 less than 2? Yes, so it continues. And at the end of each loop cycle, index is updated by adding 1. This continues until the condition is no longer true.

### While Loop

If we wanted to, we could use another loop structure called a `while` loop. A `while` loop only has the check part. So we could write something like:

```cpp
while (index < 2)
    std::cout << "Hello " << names[index] << std::endl;
```

But if we try to compile this, we'll get an error, because `index` is not declared yet. To fix that, we need to create `index` before using it.

```cpp
int index = 0;
while (index < 2)
    std::cout << "Hello " << names[index] << std::endl;
```

Once that's done, we'll notice that the program prints "Hello, Russell" repeatedly and keeps going forever. This happens because there's no code inside the loop to update the value of `index`, so it's stuck at 0.

To fix that, we need to add the line that updates `index` inside the while loop. We can use curly braces {} to group multiple statements together in the loop. So, our corrected code would look like this:


```cpp
int index = 0;
while (index < 2) {
    std::cout << "Hello " << names[index] << std::endl;
    index = index + 1;
}
```

Now, when we run this, it should behave exactly like the `for` loop and print "Hello, Russell" and "Hello, DJ" just like before.

In summary, a `for` loop is essentially a `while` loop with additional steps for initialization and updating the variable after each iteration.

> On your own: Create a program that calculates the sum of all integers in an array. Then, print the sum.
>
> Steps:
>
> - Declare an array of integers (e.g., std::array<int, 5>).
> - Initialize a sum variable to 0.
> - Use a loop to iterate through the array, adding each number to the sum.
> - Once the loop ends, print the total sum.

### Game Main Loop

You might be wondering, how is this useful? Why not just use `for` loops or the simpler version of a `for` loop that loops over everything in an array? The answer becomes clear when you're working on something like a game. In game development, every frame, or image, that you show to the player needs to be its own iteration through a loop.

For example, imagine you're setting up a game loop. You would start by loading textures, loading models, and performing other necessary setup. After that, you'd enter an infinite loop like this:

```cpp
while (true) {
    // Render the game
}
```

This loop runs forever, constantly providing the player with new frames of the game. It's essentially the core of a real-time game loop, where the game keeps rendering frames over and over.

Now, this is a very simplified version of what you'd see in an actual game. In practice, there'd be more complex checks—like ensuring the window hasn't been closed when the player exits the game But you get the idea that this loop drives the core gameplay experience.

> On your own: Create a simple "game" loop that simulates tracking scores. Store player scores in an array, and each time through the loop, prompt the user to update a player's score. Stop the loop when the user enters a specific command (e.g., "exit"). At the end, print out all scores.
>
> Steps:
>
> - Create an array (e.g., std::array<int, 5>) to store the scores of 5 players.
> - Set up a while loop that keeps running until the user types "exit".
> - Inside the loop, ask for the player's number and update the corresponding score.
>   - It would likely be easiest to always read in a string from the player... a `std::string` can be converted to an `int` using `std::stoi`.
> - After each loop iteration, display the current score for the player.
> - Once "exit" is entered, print all the player scores.

## Making Decisions with If

We've already looked at `while` loops, which repeat code until a certain condition is true. But what if we only want a piece of code to run once under a certain condition? For example, we might check if a player's health is less than zero, and if so, make the player "die." This is a case where we don't want to repeat the action over and over—just once.

To handle that, we use an `if` statement:

```cpp
if (player.health < 0) {
    // Player dies
}
```

Unlike a while loop, which would keep running the code as long as the condition is true, an `if` statement only checks the condition once. If the player's health is less than zero, the player dies. If the health isn't less than zero, the program moves on without running the code inside the `if`.

But what if you want to run something else if the condition isn't met? That's where the `else` clause comes in:

```cpp
if (player.health < 0) {
    // Player dies
} else {
    // Player stays alive
}
```

It's also possible to nest `if` statements to check for more than one condition. For example, if the player's health is less than zero, we might make the player die. But if the health is just low (say, less than five), we could suggest that the player consider healing. If neither of those conditions is met, we might just tell the player they're healthy:

```cpp
if (player.health < 0) {
    // Player dies
} else if (player.health < 5) {
    // Suggest healing
} else {
    // Player is healthy
}
```

Now, let's talk about how we compare values. So far, we've used the less-than sign (<) to compare values. If `player.health < 0` is true, the player dies. But we also have other comparison operators.

- Greater than (>) checks if one value is larger than another.
- Equals (==) checks if two values are the same. This is a common source of confusion, so let's clear it up:
    - A single equals sign (=) is used for assignment, meaning we're giving a variable a value, like `index = index + 1`.
    - Double equals (==) is used for comparison, checking if two values are equal.

For example:

```cpp
if (index == 5) {
    // Check if index is equal to 5
}
```

The reason we use double equals for comparison is that assignment (using one equals sign) happens more frequently than comparison, so the more common operation gets the shorter symbol.

But what if we want to check if two values are not equal? For that, we use the exclamation point (!=), which means "not equal." For example:

```cpp
if (index != 5) {
    // Check if index is NOT equal to 5
}
```

There are also more advanced comparisons you can make:
- Less than or equal to (<=), which checks if one value is smaller than or equal to another.
- Greater than or equal to (>=), which checks if one value is larger than or equal to another.
These operators allow us to make more flexible decisions within our programs.

### Boolean Logic

So, what if we want to ask more complicated questions in our program? For example, let's say we want to check if the player's health is less than five, and if today is Tuesday, and if the weather is raining. Writing all of those conditions as nested if statements would get pretty messy, right? It would become very hard to manage, especially as the conditions stack up.

Luckily, there's a cleaner way to handle this: we can use logical operators like and, or, and not. Instead of writing out multiple nested if statements, we can combine conditions using these operators. (Remember George Bool? He came up with this idea!)

For instance, if we want to check if all three conditions are true—health is less than five, the day is Tuesday, and the weather is raining—we can combine them with the and operator:

```cpp
if (player.health < 5 && day == "Tuesday" && weather == "raining") {
    // Do something
}
```

In C++, the && operator represents and. This means that all conditions connected by && must be true for the code inside the if block to run.

On the flip side, there's also or. If we want the code to run when either one of the conditions is true, we can use the || operator:

```cpp
if (player.health < 5 || day == "Tuesday" || weather == "raining") {
    // Do something
}
```

In this case, if any of the conditions are true, the code will execute.

Additionally, we can use not to negate a condition. We saw earlier that the exclamation point (!) means not in programming. So if we want to check the opposite of all three conditions (i.e., if the player's health is greater than five, the day is not Tuesday, or the weather is not raining), we can negate the entire expression:

```cpp
if (!(player.health < 5 && day == "Tuesday" && weather == "raining")) {
    // Do something
}
```

This is a logical negation: it's saying "if it's not the case that the player's health is less than five, and the day is Tuesday, and the weather is raining."

> On your own:  Create a reward system for a game character based on their level, achievements, and completed quests. The program should check the following conditions to determine the reward:
>
> - If the character is level 10 or higher and has completed 5 or more quests, they get a Legendary Weapon as a reward.
> - If the character is below level 10 but has completed at least 5 quests, they get a Heroic Armor.
> - If the character is level 5 or higher and has completed 3 or more quests, they receive a Golden Chest.
> - If the character is under level 5, they get Basic Gear (no matter how many quests they completed).
>
> Steps:
>
> - Ask the user for their character's level, number of quests completed, and whether they have completed a specific achievement (this can be a simple yes/no or a numeric value).
> - Use if, else if, and else statements to check if the player qualifies for a reward:
> - Print out the reward the character would receive based on these conditions.

## Structs

I promised I would teach you C++ today, so let's explore some of the "plus plus" features that C++ brings on top of C.

Let's start by getting rid of our previous `add` function. We've been talking about things like `player.health`, right? We can define a player using a `struct`. A `struct` in C++ is short for "structure," and it allows us to group multiple variables together into one logical unit.

For example, what variables might be useful for a player in a game? The player could have:
- A health value (integer).
- A name (string).
- An inventory of items (we'll use an array of item structures).

We could define a struct like this:

```cpp
struct Item {
    // Define what makes up an item, but we won't define it fully.
};

struct Player {
    int health;
    std::string name;
    std::array<Item, 10> inventory;
};
```

In this example, we're defining a Player struct that holds:

- An `int` for health.
- A `std::string` for the player's name.
- A `std::array` of 10 items, where each item is of type `Item` (but we haven't fully defined what an item contains yet).

Now, in your main function, you can create a player object and set their health:

```cpp
Player player;
player.health = 5;
```

Here's a quirk of C++: Most code blocks (stuff between curly braces) don't need a semicolon at the end. However, structs do, and that's due to legacy reasons from C. Back in the day, C allowed you to define variables of custom structure types inline, and the semicolon at the end was required. C++ tries hard to remain compatible with old C code, which sometimes leads to these odd behaviors that are a bit of a pain to deal with.

This is a basic example of how we can use structs to group related data together in C++. But let's think of something more useful that we can do with structs in the next step.

### Array Struct

Let's walk through the process of creating our own custom array. Instead of using `std::array` directly, we can define a new struct that inherits from `std::array`. This allows us to create a more customized version of an array that can store specific types and sizes of data. For example, we could make an array that stores five integers.

```cpp
struct MyArray : public std::array<int, 5> {
    // custom functionality here
};
```

Now, let's say we want to add two arrays together. We can define a function within the struct that performs this addition. Since functions can be added inside structs, we can pack variables and functions together. Here's an example of how we might do this:

```cpp
struct MyArray : public std::array<int, 5> {
    void add(const MyArray& other) {
        for (int i = 0; i < this->size(); i = i + 1) {
            (*this)[i] += other[i];
        }
    }
};
```

Notice that we used the `this` pointer inside the function. The `this` pointer refers to the current instance of the struct. In this case, `this` is the array we're currently working with. If we wanted to print the value of an array element inside a function, we would do something like this:

```cpp
void print() {
    std::cout << (*this)[0] << std::endl;  // print the first element
}
```

Let's break it down a bit. The `*this` syntax accesses the current instance of the object that the function is being called on. So, when we write `(*this)[0]`, we are getting the first element of the current instance of MyArray.

Now let's try creating an array, setting its first element to 10, and then calling the `print()` function. Here's how we would do it:

```cpp
MyArray a;
a[0] = 10;
a.print(); // prints 10
```

We'll explore what `*this` and the pointer stuff means more deeply later, but for now, just know that this refers to the current instance of the struct, and `*this` accesses it.

Next, let's see how we can add two arrays together. We can loop through the elements of both arrays and add their corresponding values. Since we've inherited from `std::array`, we have access to all of its functions, including size(), which tells us the number of elements in the array.

Here's an example of how to add two arrays element by element:

```cpp
void add(const MyArray& other) {
    for (int i = 0; i < this->size(); i = i + 1) {
        (*this)[i] = (*this)[i] + other[i];
    }
}
```

Here, `this->size()` gives us the number of elements in the array, and we loop through the array indices, adding the corresponding values from other to the current array (`this`). The `this` is technically unnecessary tho... the compiler is smart enough to find variables and functions defined in the same struct so we could technically write the `for` loop like this:

```cpp
for (int i = 0; i < size(); i = i + 1)
```

Now, if we extend our print function to print every element:

```cpp
void print() {
    for(int i = 0; i < size(); i = i + 1)
        std::cout << (*this)[i] << std::endl;
}
```

And create two arrays and add them:

```cpp
MyArray a = {1, 2, 3, 4, 5};
MyArray b = {5, 6, 7, 8, 9};
a.add(b);
a.print();
```

It should print "6, 8, 10, 12."

> On your own: Create a Character struct with stats like strength, agility, and intelligence. Then, define a Player struct that contains:
>
> - The player's name (string).
> - The player's level (int).
> - A Character object representing the player's stats.
>
> Additionally, you’ll add a function to increase the player's level and another to display the character’s stats.
>
> Steps:
>
> - Define the Character struct with strength, agility, and intelligence (all integers).
> - Define the Player struct with name, level, and a Character object.
> - Create a function `level_up` that increases the level by 1 and boosts the character's stats by 5 points each time the player levels up.
> - Create a `print_stats` function that prints the player's name, level, and the Character stats (strength, agility, intelligence).
> - In `main`, create a Player object, level them up, and print their stats.

### Templates

An array of 5 integers is pretty limited, right? Especially if we only need to store 4 values, and the array ends up filling the extra space with random, weird values. This can be a pain and doesn't really meet our needs. So how can we improve this?

One way to make this more flexible and useful is by turning our array into what's called a `template`. A `template` in C++ allows us to create generic structures that can work with any data type, instead of being tied to a specific type like int. This gives us more flexibility.

We start by writing `template` before defining our array. This tells the compiler that the type of the array is generic—we can define it later.
In a template, we can use a `typename` variable. Instead of specifying a fixed type (like `int` or `float`), we use `T` (or any other name we choose) as a placeholder for any type.
We can also specify the size of the array as a variable instead of a constant number. This makes the array more flexible since we can adjust its size based on the data we need to store.

Let's look at how this works:

```cpp
template <typename T, int Size>
struct MyArray : public std::array<T, Size> {
    // Rest...
};
```

`T` is the type of elements in the array.
`size` is the number of elements we want in the array.

Now, when we create an array using this template, we specify the type and size:

```cpp
MyArray<int, 4> myIntArray; myIntArray[0] = 1; myIntArray[1] = 2; myIntArray[2] = 3; myIntArray[3] = 4;
```

Here, T is replaced by int, and size is set to 4, so we get an array of 4 integers.

If we wanted to make a similar array of `float` values, we could simply do this:

```cpp
MyArray<float, 3> myFloatArray;  // array of 3 floats
```

The key benefit here is that we no longer have to worry about extra values or fixed sizes. We specify exactly what we need when we create the array. The template makes the array structure flexible, allowing us to work with any type (`T`) and any size (`Size`), without hardcoding the values.

> On your own: Implement a simple stack data structure using a template (think about a stack of plates at a restaurant where you can put dirty ones on and someone will sometimes come and take some of them away). Your stack should support the following operations:
>
> - push(T value): Add an item to the top of the stack.
> - pop(): Remove and return the item from the top of the stack.
> - peek(): Return the item from the top of the stack without removing it.
> - is_empty(): Check if the stack is empty.
>
> Steps:
>
> - Create a Stack template class that accepts a data type T.
> - Define a public array of some size (maybe make the size a template variable?) to store the elements.
> - You will need an extra variables (eg. fullness) to track how many slots in the stack are currently being used.
>   - How might we handle the case when the stack is full and we can't push another thing on?
> - Implement functions for each of the 4 operations mentioned above.
> - Test your stack implementation in main with multiple types, like integers and strings.

## The Stack

Up until now, everything we've been working on has been using what's known as the stack in memory. Let me show you a quick trick that highlights an interesting quirk of the stack.

We'll create a simple function called `add_top`. This function won't take any parameters, but inside it, we'll create a variable called `top`, which will be an integer. We'll set top equal to `top + 1`—something we do often in code that there's a simpler way to write this. Instead of `top = top + 1`, we can write `top += 1`. The += operator is a shorthand that expands out to the same thing:

```cpp
void add_top() {
    int top;
    top += 1;
}
```

Now, if we write similar `set_to`, `print_to` add them to main and call them, we expect it to show some random garbage value because top wasn't initialized in the `print_top` function. However, in reality, something odd happens.

```cpp
void set_top() {
    int top;
    top = 0;
}

void print_top() {
    int top;
    std::cout << top << std::endl;
}

int main() {
    set_top();
    add_top();
    print_top();
}
```

When we run this in debug mode on a Windows machine, the C++ compiler is smart enough to catch this "mistake" and spews out an error, warning us that this could lead to bugs. But what if we switch to release mode—where speed is prioritized over error checking? In that case, the program may run without complaining, but it would still be unpredictable.

If we compile and run the same code on Linux, however, you might notice that the program consistently prints out "1". Now, why is that? Let's dig into it by using the debugger.

If we break at a line of the program where we create top and print out the memory address of top (`&top`), we'll see something like 0x7fful: a hexadecimal address.
We step into the `add_top` function and check the memory address of top again. It turns out the memory address hasn't changed. The memory address is the same in both the `set_top` and `add_top` functions. This is strange because we would expect these to be different.
This suggests that we're reusing the same memory location, which could lead to unexpected behavior.

In C++, variables are usually stored on the stack, which is a section of memory that works like a set of plates stacked on top of each other. When a function is called, its local variables are placed on top of the stack. When the function exits, that memory space is removed from the stack (like a bus boy taking away the dirty plates to be washed).

When we start the program, the main function runs, and any variables we create (like player) are stored on the stack.
When we call the `set_top` function, it creates its own `top` variable and places it on the stack. When the function finishes, that memory is taken away.
When we call `add_top`, the stack reuses the same memory location that was used by `top` in the `set_top` function, because the compiler is trying to optimize memory usage. This means that the same memory address is reused across multiple functions.

In simpler terms: because C++ tries to be efficient, it reuses memory for local variables. If multiple functions use the same type of variable, they might end up pointing to the same memory address on the stack.

On Linux, the program printed "1" because the memory location where `top` is stored got overwritten by the `add_top` function. The `top` variable in the `set_top` function was essentially lost, and the new function used the same memory address. If you add more calls to `add_top` the value printed should be equal to the number of `add_top` calls.

At this point, we need to understand that variables in C++ are more like labels for memory locations in the computer's memory. It's like being assigned a locker number at school. You don't own the locker; you're just assigned a specific locker number to access your stuff. In C++, when we say a variable has a value, what we're really saying is that the variable is a label pointing to a location in memory where the value is stored.

For example, the variable top might point to the locker at address 0x7fful. This means that whenever we access top, we're actually accessing the value stored in that memory address. The problem arises when multiple functions reuse the same "locker" or memory address, leading to overwritten values.

### Pointers

A pointer is a special kind of variable. Instead of holding a value like an integer, it holds a memory address—the "locker number" where a value is stored. In simpler terms, a pointer is a variable that points to another variable's memory location.

Let's say we assign the pointer `p` the memory address of `top`. Now, `p` holds the "locker number" where `top` is stored. We can use this pointer to access and manipulate the value of `top` indirectly:

```cpp
int top = // whatever
int* p = &top;
*p = 21;
std::cout << top << std::endl; // This should print 21
```

This happens because `p` holds the memory address of top, and using that address, we can treat `p` as if it were top by dereferencing (`*`) `p`.

## The Heap

When you're working with the stack, it's important to remember that the memory used by a function is taken away once that function ends. As soon as another function is called, the memory previously allocated for the first one is likely to be overwritten. This is because, on the stack, memory is reclaimed automatically when a function call finishes.

But what happens if we need to retain memory across multiple function calls? That's where the heap comes in. The heap is a separate section of memory where you can request and manage blocks of memory. To do this, you ask the system for a small block of memory and, in return, it gives you a pointer that you can use to access and modify that block.

For example, in C++, you might allocate memory on the heap like this:

```cpp
int* on_heap = new int;
```

Now, you have a pointer, `on_heap`, pointing to a block of memory in the heap. You can assign a value to it:

```cpp
*on_heap = 6;
```

When you print the value, you'll get 6, as the pointer is dereferencing (accessing) the memory it points to.

One important concept here is dereferencing, which is done using the asterisk (*) symbol. Dereferencing means accessing the value stored at the memory address that the pointer is pointing to. Without the asterisk, you're just working with the pointer itself, not the value stored at that address.

However, using the heap comes with some trade-offs. The biggest downside is that the operating system has to track memory allocations on the heap, which adds some overhead. More critically, you must manually manage the memory, specifically by **deleting** it when you're done. If you forget to delete memory, it leads to a memory leak—a situation where memory is allocated but never freed, causing the program to consume more and more memory.

```cpp
delete on_heap
```

Memory leaks are serious issues. For example, there are stories about early versions of Microsoft Excel that would crash after running for a week due to memory leaks. As Excel created new memory blocks but never released old ones, the system eventually ran out of memory and crashed.

To avoid this, it's generally a good idea not to use `new` for memory allocation. Instead, you can use modern memory management techniques, like `std::make_unique` from the C++ standard library. This ensures that the allocated memory is automatically deleted when you're done with it, reducing the risk of memory leaks. For instance:

```cpp
auto on_heap = std::make_unique<int>();
*on_heap.get() = 6;
```

This code works similarly to the previous example, but `std::make_unique` (technically std::unique_ptr) handles memory cleanup for you. The allocated memory will be freed when the `on_heap` pointer goes out of scope. Note that with `std::make_unique`, instead of using dereferencing (*), you would access the value using the `get()` method, as it returns a pointer to the underlying memory:

```cpp
std::cout << *on_heap.get() << std::endl;  // prints 6
```

> On your own: Create a function that manipulates a variable using a pointer and dereferencing.
>
> Steps:
>
> - In the main function, create a variable `int top = 10;`.
> - Declare a pointer int* p that points to the memory address of top (use &top).
> - Create a function increase_by_ten(int* p) that increments the value pointed to by p by 10.
> - Call increase_by_ten(p) from the main function.
> - Print the value of top after calling the function to verify it has been modified through the pointer.

## Moving vs Copying

We're going to shift gears from the somewhat tricky heap concept and talk about something else: Moving versus Copying. But before we dive into that, let's introduce a new type.

Earlier, we saw a `std::array` with `std::string` elements—like "Russell" and "DJ". We could loop through the names and print each one. For example:

```cpp
for (const auto& name : names)
    std::cout << "Hello " << name << std::endl;
```

When it comes to printing, we need to be precise with the formatting. The computer does exactly what we tell it, so if we forget to add a space, no space will appear. If we do specify a space, it will print that space exactly. It's a matter of being careful and clear in our instructions to the computer.

Now, let's say we want to add `Leo` to the list. If we try to do this with a `std::array`, it won't work because `std::array` has a fixed size. If we declare it to hold two elements, we can't add a third one without causing an issue.

But what if we don't know how many elements we'll have ahead of time? This is where `std::vector` comes in. It works similarly to `std::array`, but it has the flexibility to resize itself dynamically. However, to use it, we need to include its header file (`#include <vector>`).

With a vector, you can add items after it's already been created. For instance:

```cpp
std::vector<std::string> names = {"Russel", "DJ"};
names.push_back("Leo");
```

So, why are we talking about `std::vector` now, and not earlier, when it would have been more useful? `std::array` resides on the stack, while `std::vector` is allocated on the heap.

- A std::array is a small block of memory on the stack.
- A std::vector is a pointer to memory allocated on the heap.

Here's where the distinction becomes important: If you make a copy of an array, it's a true copy, and each version of the array exists independently. But if you make a copy of a vector, what you're actually copying is just the pointer to the heap memory (at least if std::vector didn't have some extra machinery to make a true copy for you). So, both the original and the copy are pointing to the same data in memory. Modifying the data through one vector will affect the other because they are both pointing to the same memory location.

Let's clarify this with an example. Suppose we create a second vector, `names2`, as a copy of `names`:

```cpp
std::vector<std::string> names2 = names;
names2[0] = "Changed";
```

In this case, modifying `names2` doesn't affect the original `names` vector, because the data is copied correctly. If we move the contents of `names` into `names2` using a move operation, something different happens:

```cpp
std::vector<std::string> names2 = std::move(names);
```

After this, `names` will be empty because its contents have been moved to `names2`. The memory from `names` is no longer accessible through the original vector, and the pointer inside `names` has effectively been "moved" to `names2`. This is how vectors handle the move operation, ensuring that the original vector is left in a valid but empty state, and `names2` now owns the data.

Now, let's look at a more manual way of doing things. If we create a raw dynamic array instead of using `std::vector`, we'd have to manage everything ourselves. For example:

```cpp
auto names = new std::string[3]{"Russell", "DJ", "Leo"};
```

Here, instead of using a vector, we're manually allocating an array on the heap. We'll also have to manually loop through the array to access its elements:

```cpp
for (int i = 0; i < 3; ++i)
    std::cout << names[i] << std::endl;
```

But when we copy `names` to another pointer, `names2`, we're not copying the actual array itself. We're just copying the pointer, so both `names` and `names2` point to the same memory. This means that modifying one will affect the other.

For example:

```cpp
auto names2 = names;
names2[0] = "Changed";
std::cout << names[0] << std::endl;  // It will print "Changed" because they point to the same memory.
```

Even if we attempt to move `names` (using `std::move`), we'll end up with the same behavior, as we're just moving a pointer, not the actual memory:

```cpp
std::string* names2 = std::move(names);
```

At this point, `names` is in an invalid state, and `names2` now holds the pointer to the array. However, since we're not using `std::vector`'s extra features, we've lost some of the benefits of move semantics.

`std::vector` does a lot of work for us, including managing memory allocation and move semantics. When you move a vector, it transfers ownership of the memory, while a simple raw pointer just transfers the pointer itself. This is why using vectors can make things easier, especially when working with dynamic-sized collections.

## Lifetimes

This introduces the concept of a **lifetime**. Normally, a variable has a specific lifespan: it starts existing when it's created, and it stops existing when the block of code (area surrounded by {}) it belongs to finishes executing. In other words, the variable's "life" begins when it's created and ends when it goes out of scope, typically at the next closing curly brace. For example, a variable like names is born when it's declared and dies when the block or function it's in ends.

However, when we allocate memory on the heap, the memory doesn't "die" when it goes out of scope. Instead, it exists until we explicitly tell the program to delete it. This is different from stack-based variables, which are automatically cleaned up when they go out of scope.

Now, let's think about what happens when we use `std::move` to transfer the contents of a vector into another variable, like `names2`. In this case, the lifetime of `names` ends at the point where it's moved. The data that was originally in `names` is now transferred to `names2`, and we no longer care about where `names` lives. The focus now shifts to `names2`, and its lifetime is the one that matters.

Does that make sense? When we move a vector, the ownership and responsibility for the data is transferred, and the "life" of the original variable is effectively over, even though the underlying data may still exist in memory.

> On your own: You’re building a game where each level contains multiple objects (enemies, items, obstacles). Use std::vector to manage these objects dynamically, ensuring efficient memory usage and easy manipulation.
>
> Steps:
> 
> - Define a `game_object` Class:
>   - Add name (string) and position (int) as attributes.
>   - Add the function to print out the `game_object`
> - Use std::vector to manage objects in a `level` type:
>   - Store `game_object`s in a `std::vector` for automatic memory management.
>   - Add and remove objects using vector operations.
>   - Support printing all of the objects in the level
> - Test in main():
>   - Create and manage `game_objects` with your `level`.
>   - Add and remove some objects, then print the results.

## Views

It turns out that dealing with all these concepts can be pretty tricky, and it's something we'd rather not have to think about too much. To make things easier, we introduced the idea of a **view**. Normally, when you work with a vector, it's an "owning" variable. The vector owns the data it contains, meaning it's responsible for the lifetime of those elements. When the vector dies, the data inside it gets destroyed.

But what if you just want to look at the data without taking ownership? This is where views come in. A view is like a lens through which you can access data, but it doesn't own that data or control its lifetime. For example, instead of using a vector directly, you can create a `std::span` to look at the data in the vector.

To use a view, you would need to include the span library (`#include <span>`) and create a `std::span` object pointing to the vector, like so:

```cpp
std::span<std::string> names_view(names);
```

You can still loop over the data in the view, access individual elements, and work with it just like you would with the original vector. The key difference is that `names_view` is just a view—it doesn't own the memory. It's simply pointing to the data in the vector, and it doesn't manage the lifetime of the vector's data at all.

If you get an error about `std::span` not being available, it might be because you're using an older version of C++. In that case, you can set the C++ standard to 20, which includes `std::span`. You can do this in your `CMakeLists.txt` by setting the `CXX_STANDARD` property to 20.

```cmake
set_target_properties(main PROPERTIES CXX_STANDARD 20)
```

Once that's sorted out, you'll see that the behavior remains the same, but now you have a `names_view` that simply looks at the `names` vector, without taking ownership. This allows us to manage ownership at a higher level—usually in `main()` or some other top-level function—while passing around views that reference the actual data. This keeps things clean and avoids unnecessary ownership complications.

There are different types of views for different kinds of data:

- For arrays or vectors, you use `std::span`.
- For strings, you use `std::string_view`.
- For basic types like `int`, `float`, and others, you can just use a reference as a view.

Let's look at a simple example to see how views work in practice. Suppose you want to swap two integers:

```cpp
void swap(int a, int b) {
    int temp = a;
    a = b;
    b = temp;
}
```

You might create two integers, `a` and `b`, and swap them like this:

```cpp
int a = 5;
int b = 7;
swap(a, b);
std::cout << "a = " << a << ", b = " << b << std::endl;
```

The problem here is that after the "swap," the values of `a` and `b` won't have changed. This is because `swap` is working with copies of the original variables, not the original variables themselves. The variables `a` and `b` inside swap only exist in the function's scope. When the function ends, those variables get taken away by the bus boy.

To fix this, we need to make sure that swap is working with references (views) to the original variables, not copies. We can do this by changing the function to take references (&) to `a` and `b`:

```cpp
void swap(int& a, int& b) {
    int temp = a;
    a = b;
    b = temp;
}
```

Now, `a` and `b` inside the function are views to the original variables from `main()`. When we swap the values, the changes will be reflected in the original variables. When we run this updated code:

```cpp
int a = 5;
int b = 7;
swap(a, b);
std::cout << "a = " << a << ", b = " << b << std::endl;
```

We'll see that `a` is now 7 and `b` is 5, because the function is modifying views to the original variables, not copies.

The important takeaway here is that when you use a reference, you're not copying the data—you're creating a view of the data. A reference is essentially a view that points to the original memory. This works similarly to a pointer, but without the complexity of pointer semantics. Instead of dealing with pointer dereferencing, we just work directly with the data via the reference.

This principle also applies to strings and other objects. A view to an `int` is simply an `int&` (a reference to an int), a view to a string is a `std::string_view`, and so on. The key idea is that we're not creating copies of the data, just references to the existing data.

> On your own: Manage enemy health using a view (std::span) instead of copying the entire vector.
>
> Steps:
>
> - Create a `std::vector<int>` to hold the health values of the enemies.
> - Define a function that accepts a `std::span<int>` to look at the health data without owning it.
> - In the function, loop through the health values and decrease each enemy's health by a fixed amount.
> - Make sure that modifying the health through the view reflects the changes in the original vector.

## Enums

Let's talk about something that's both simple and a bit tricky to wrap your head around: `enums`.

An `enum` (short for enumeration) is essentially a list of all possible values a variable can take. For example, imagine we're building a game, like Dead by Daylight. In this game, a player's state might be one of the following:

```cpp
enum State {
    Alive,
    Dead,
    Dying,
    Hooked,
};
```

This is where an `enum` comes in. We can create an `enum` called `State` to represent these states. So, if we declare a variable of type `State`, it can only hold one of the values from the list: either `State::Alive`, `State::Dead`, `State::Dying`, or `State::Hooked`.

Now, let's take a step back. What exactly is an enum? It's a way of creating a variable that can only be one of a predefined set of values. The term "enumeration" comes from the fact that we're essentially enumerating (listing) all the possible states. But behind the scenes its really just an integer.

But what if you want a more complex state? Let's say we're designing a player state in a Mario or Metroid-type game. The player can be:

```cpp
enum Flags {
    Moving,
    InAir,
    Jumping,
    Attacking,
    Dead,
};
```

But what if the player is both jumping and attacking at the same time? Well, instead of just having one of these states, we combine them. The player can be in multiple states at once, and that's where things get interesting.

To handle this, we need a concept called bit-checking. When working with flags, instead of just setting a single value (like moving or attacking), we manipulate individual bits in the integer which the enum is pretending its not. Each state in our game can be represented by a bit in a binary number, and then we use bitwise operations (like OR) to combine the states.

For example, let's say we define our flags like this:

```cpp
enum Flags {
    Moving = 1 << 1, // Binary 10
    InAir = 1 << 2, // Binary 100
    Jumping = 1 << 3, // Binary 1000
    Attacking = 1 << 4, // Binary 10000
    Dead = 1 << 5, // Binary 100000
}
```

But what does "1 shifted over by 1" (`1 << 1`) mean? Well, behind the scenes, all numbers in a computer are just sequences of ones and zeros. So when you "shift" a number, you move the binary digits to the left, essentially just adding a 0 on the right side.

For example:

- 1 is 0001 in binary.
- 2 is 0010 (that's 1 shifted by one place).
- 3 is 0011.
- 4 is 0100 (that's 1 shifted by two places).
- 5 is 0101.
- 6 is 0110.
- 7 is 0111.
- 8 is 1000 (that's 1 shifted by three places), and so on.

If we shift the binary value 1 over by one place, it becomes 2, by two places it becomes 4, and so on, multiplying by 2 each time.

Now, let's say we want to represent a player who is both jumping and attacking at the same time. We can combine these two states by performing a bitwise OR operation. If we "OR" these two values together (combine their bits), we get:

```
01000  (Jumping)
10000  (Attacking)
-----
11000  (Combined)
```

Now, the combined state has both the jumping and attacking bits set to 1. This is a way of saying, "The player is both jumping and attacking."

In more advanced topics, like graphics programming, flags and bit manipulation are commonly used. The beauty of flags lies in their ability to let you efficiently manage multiple states using just a single number. Instead of needing separate variables for each state, you can combine and check different states quickly with bitwise operations. This is particularly beneficial in performance-sensitive areas like graphics rendering or game state management, where efficiency is key.

> On your own: Using the same Flags enum as before: Write code that checks if the InAir flag is set within this state. Your code should return true if the flag is set and false otherwise.
>
> Steps:
>
> - Create an enum variable and assign it the value 28.
> - Use the bitwise AND operator (&) between the combined state (28) and the value of.
> - If the result of the bitwise AND is not zero, it means the InAir flag is set. The bits for InAir were both 1 in both numbers.
>   - If the result of the bitwise AND is zero, it means the InAir flag is not set. At least one of the bits was 0.
> - Print the result in the main function.

## Conclusion

We've covered most of the essential topics in C++ that are relevant to game development. Did I teach you everything there is to know about C++ in that time? Definitely not. But we did go over the majority of syntax you'll actually use in day-to-day programming.

What I mean by syntax is the human-readable part of the language—the actual code that you write. The next challenge is knowing what a type or object can do. For example, we've seen that we can use the `size()` function on a `std::vector`, but what other functions are available? This is where the C++ reference comes into play: https://en.cppreference.com/w/cpp/container/vector.html

You should get used to referring to the C++ documentation, because this is where you'll find all the functions and features that a given object or type provides. For example, on top of basic operations, a vector can do things like check if it's empty, push elements to the back, erase items, swap contents, and compare with other vectors. All of these functions are part of the vector header and the containers library, which also defines other useful structures like arrays, stacks, sets, and forward lists.

The easy part is knowing the syntax—what the code looks like and how it's structured. The hard part is understanding the vast number of functions and methods that are available for the different data structures. And unfortunately, that's something I can't cover in one short article.

That's why people spend years in college, learning all these intricacies. But here's the good news: if you can read English, reading code is a lot easier than it seems. There's a very small difference between how English is written and how code is written. Good programmers tend to use descriptive variable names and self-explanatory functions, making it much easier to understand the code at a glance.

So, hopefully, after watching reading this article, you'll have the skills to read and understand a bit more code—and that's a huge first step in becoming a (better) programmer.
