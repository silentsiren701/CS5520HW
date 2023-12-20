import UIKit

//MARK: Question 1, Concatenating Two Integers

/* Create a function to concatenate two integer arrays.
 concatenate([1, 3, 5], [2, 6, 8]) ➞ [1, 3, 5, 2, 6, 8]

 concatenate([7, 8], [10, 9, 1, 1, 2]) ➞ [7, 8, 10, 9, 1, 1, 2]

 concatenate([4, 5, 1], [3, 3, 3, 3, 3]) ➞ [4, 5, 1, 3, 3, 3, 3, 3]
 
 Do not forget to return the resulting array.
 
 Borrowed from: edabit.com
 */

//Calling the function
func concatenate(firstArray:[Int], secondArray:[Int]) -> [Int]{
    return firstArray + secondArray
}


// let concatenatedArray = concatenate(array1:[...], array2:[...])
let concatenatedArray1 = concatenate(firstArray:[1, 3, 5], secondArray: [2, 6, 8])
let concatenatedArray2 = concatenate(firstArray:[7, 8], secondArray: [10, 9, 1, 1, 2])
let concatenatedArray3 = concatenate(firstArray:[4, 5, 1], secondArray: [3, 3, 3, 3, 3])

// print(concatenatedArray)
print(concatenatedArray1)
print(concatenatedArray2)
print(concatenatedArray3)

