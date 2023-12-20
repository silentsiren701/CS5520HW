import UIKit

//MARK: Question 2, Sort and Array by String length

/* Create a function that takes an array of strings and return an array, sorted from shortest to longest.
 
 sortByLength(["Google", "Apple", "Microsoft"])
 ➞ ["Apple", "Google", "Microsoft"]

 sortByLength(["Leonardo", "Michelangelo", "Raphael", "Donatello"])
 ➞ ["Raphael", "Leonardo", "Donatello", "Michelangelo"]

 sortByLength(["Turing", "Einstein", "Jung"])
 ➞ ["Jung", "Turing", "Einstein"]
 
 Borrowed from: edabit.com
 */


//Calling the function

func sortByLength(input:[String]) -> [String]{
    var inputDuplicate:[String] = input
    var i3:String
    for i1 in 0...inputDuplicate.count-1 {
        for i2 in i1...inputDuplicate.count-1 {
            if inputDuplicate[i1].count > inputDuplicate[i2].count {
                i3 = inputDuplicate[i1]
                inputDuplicate[i1] = inputDuplicate[i2]
                inputDuplicate[i2] = i3
            }
        }
    }
    return inputDuplicate;
}

// let sortedArray = sortByLength(...)
let sortedArray1 = sortByLength(input: ["Google", "Apple", "Microsoft"])
let sortedArray2 = sortByLength(input: ["Leonardo", "Michelangelo", "Raphael", "Donatello"])
let sortedArray3 = sortByLength(input: ["Turing", "Einstein", "Jung"])

// print(sortedArray)
print(sortedArray1)
print(sortedArray2)
print(sortedArray3)

