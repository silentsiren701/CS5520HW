import UIKit

//MARK: Question 6, Divide and conquer
/*
 First, create a function that returns the number of times an integer can be divided by another integer without a remainder. The function should return nil if the division doesn’t produce a whole number. Name the function divideIfWhole.

 Then, write code that tries to unwrap the optional result of the function. There should be two cases: upon success, print "Yep, it divides \(answer) times", and upon failure, print "Not divisible :[".

 Finally, test your function:
 
 Call divideIfWhole(10, by: 2) -> 5. Since, the returned value is not nil, print: "Yep, it divides 5 times."
 divideIfWhole(10, by: 3) -> nil. Since, the returned value is nil, print: "Not divisible :[."
 
 
 
 borrowed from: https://www.kodeco.com/
 */

func divideIfWhole(number:Int, divider:Int) -> Int? {
    if (number % divider == 0) {
        return number / divider;
    }
    return nil;
}

// Test Case 1: 10 / 3
if let result1 = divideIfWhole(number: 10, divider: 2) {
    print("Yep, it divides \(result1) times.")
} else {
    print("Not divisible :[.")
}


// Test Case 2: 10 / 3
if let result2 = divideIfWhole(number: 10, divider: 3) {
    print("Yep, it divides \(result2) times.")
} else {
    print("Not divisible :[.")
}
