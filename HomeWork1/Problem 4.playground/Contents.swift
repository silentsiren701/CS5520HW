import UIKit

//MARK: Question 4, Remove the First and Last Characters

/*
 Create a function that removes the first and last characters from a string.
 
 removeFirstLast("hello") ➞ "ell"

 removeFirstLast("maybe") ➞ "ayb"

 removeFirstLast("benefit") ➞ "enefi"

 removeFirstLast("a") ➞ "a"
 
 Borrowed from: edabit.com
 
 HINT: remove(at: index)
 */

//Calling the function
func removeFirstLast(input:String) -> String {
    var inputDuplicate:String = input;
    if inputDuplicate.count >= 3 {
        inputDuplicate = String(inputDuplicate.dropFirst().dropLast());
    }
    return String(inputDuplicate);
}

// let removedFirstAndLast = removeFirstLast(...)
let removedFirstAndLast1 = removeFirstLast(input: "hello")
let removedFirstAndLast2 = removeFirstLast(input: "maybe")
let removedFirstAndLast3 = removeFirstLast(input: "benefit")
let removedFirstAndLast4 = removeFirstLast(input: "a")

// print(removedFirstAndLast)
print(removedFirstAndLast1)
print(removedFirstAndLast2)
print(removedFirstAndLast3)
print(removedFirstAndLast4)
