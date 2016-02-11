//: [Previous](@previous)

import Foundation


/* given an array of ints, and a range, return the count of mistakes
 * where mistakes are either
 * - int is out of range
 * - int is missing from range
 * - int is duplicated
 */
func countOfRangeMistakesInArray(inputArray:Array<Int>, _ lower:Int, _ upper:Int)->Int{
   var countOfMistakes = 0
   var setOfNums:Set<Int> = Set()
   
   for num:Int in inputArray {
      //oor
      if(num < lower || num > upper) { countOfMistakes++ }
      
      //duplicate
      else if(setOfNums.contains(num)) { countOfMistakes++ }
      
      setOfNums.insert(num)
   }
   
   //missing
   for var t = lower; t <= upper; t++ {
      if(setOfNums.contains(t) == false) { countOfMistakes++ }
   }
   
   return countOfMistakes
}

//out of range
countOfRangeMistakesInArray([0, 1, 2, 3, 4, 5, 6, 7], 1, 7) == 1

//missing
countOfRangeMistakesInArray([0, 1, 3, 4, 5, 6, 7], 0, 7) == 1

//duplicated
countOfRangeMistakesInArray([0, 1, 2, 2, 3, 4, 5, 6, 7], 0, 7) == 1

//oor and missing
countOfRangeMistakesInArray([0, 1, 2, 3, 4, 5, 7], 1, 7) == 2

//oor and missing and duplicates
countOfRangeMistakesInArray([0, 1, 2, 2, 3, 4, 5, 7], 1, 7) == 3



/**
 * factorial, recursive
 */
func factorial(integer:Int) -> Int {
   if(integer == 1) { return 1 }
   else {
      return integer * factorial(integer - 1)
   }
}
factorial(1) == 1
factorial(2) == 2
factorial(3) ==  6
factorial(4) ==  24
factorial(5) ==  120

/**
 * remove all duplicates from an array
 */
func removeAllDuplicates(inputArray:Array<Int>) -> Array<Int> {
   print(inputArray)
   var found:Set<Int> = Set()
   for num in inputArray {
      if(found.contains(num) == false) {
         found.insert(num)
      }
   }
   return Array(found.sort())
}

var removed = removeAllDuplicates([2, 3, 2, 4, 6, 6, 1])
removed == [1, 2, 3, 4, 6]

//: [Next](@next)
