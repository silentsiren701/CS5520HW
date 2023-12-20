import UIKit

//MARK: Question 5, Four Passengers and a Driver

/*
 A typical car can hold four passengers and one driver, allowing five people to travel around. Given n number of people, return how many cars are needed to seat everyone comfortably.

 carsNeeded(5) ➞ 1

 carsNeeded(11) ➞ 3

 carsNeeded(0) ➞ 0
 
 Borrowed from: edabit.com
 */

//Calling the function
func carsNeeded(numberOfPeople:Int) -> Int {
    var numberOfCars = numberOfPeople / 5;
    if numberOfPeople % 5 != 0 {
        numberOfCars += 1;
    }
    return numberOfCars;
}
// let numberOfCars = carsNeeded(...)
let numberOfCars1 = carsNeeded(numberOfPeople: 5)
let numberOfCars2 = carsNeeded(numberOfPeople: 11)
let numberOfCars3 = carsNeeded(numberOfPeople: 0)
// print(numberOfCars)
print(numberOfCars1)
print(numberOfCars2)
print(numberOfCars3)
