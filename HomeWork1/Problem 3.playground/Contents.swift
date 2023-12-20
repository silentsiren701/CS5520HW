import UIKit

//MARK: Question 3, Find the Largest Numbers in a Group of Arrays

/*
 Create a function that takes an array of arrays with numbers. Return a new (single) array with the largest numbers of each.

 findLargest([[4, 2, 7, 1], [20, 70, 40, 90], [1, 2, 0]]) ➞ [7, 90, 2]

 findLargest([[-34, -54, -74], [-32, -2, -65], [-54, 7, -43]]) ➞ [-34, -2, 7]

 findLargest([[0.4321, 0.7634, 0.652], [1.324, 9.32, 2.5423, 6.4314], [9, 3, 6, 3], [1, 2, 3, 4]]) ➞ [0.7634, 9.32, 9, 4]
 
 It is OK, if your returning array is [Double]
 
 Borrowed from: edabit.com
 */

//Calling the function

func findLargest(arrays:[[Double]]) -> [Double] {
    // a small closure to help find the largest number in an array
    
    var resultArray:[Double] = [Double]();
    
    for array in arrays {
        var largest:Double = array[0]
        for num in array {
            largest = max(num, largest)
        }
        
        resultArray.append(largest)
    }
    
    return resultArray
}

// let arrayOfLargests = findLargest(...)
let arrayOfLargests1 = findLargest(arrays: [[4, 2, 7, 1], [20, 70, 40, 90], [1, 2, 0]])
let arrayOfLargests2 = findLargest(arrays: [[-34, -54, -74], [-32, -2, -65], [-54, 7, -43]])
let arrayOfLargests3 = findLargest(arrays: [[0.4321, 0.7634, 0.652], [1.324, 9.32, 2.5423, 6.4314], [9, 3, 6, 3], [1, 2, 3, 4]])

// print(arrayOfLargests)
print(arrayOfLargests1)
print(arrayOfLargests2)
print(arrayOfLargests3)
