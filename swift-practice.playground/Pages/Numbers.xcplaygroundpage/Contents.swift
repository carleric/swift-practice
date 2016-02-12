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

/**
 * count number of occurrences of each number in an array
 */
func countOfOccurrences(inputArray:Array<Int>) -> Dictionary<Int, Int> {
   var counts = [Int: Int]()
   for num in inputArray {
      counts[num] = counts[num] == nil ? 1 : counts[num]! + 1
   }
   return counts
}

var counts = countOfOccurrences([2, 3, 2, 4, 6, 6, 1])
counts == [1:1, 2:2, 3:1, 4:1, 6:2]


/**
   from https://www.interviewcake.com/question/java/coin
 
   Imagine you landed a new job as a cashier...
   Your quirky boss found out that you're a programmer and has a weird request about something they've been wondering for a long time.

   Write a function that, given:

   an amount of money
   an array of coin denominations
   computes the number of ways to make amount of money with coins of the available denominations.

   Example: for amount=44 (44¢) and denominations=[1,2,3][1,2,3] (11¢, 22¢ and 33¢), your program would output 44—the number of ways to make 44¢ with those denominations:

   1¢, 1¢, 1¢, 1¢
   1¢, 1¢, 2¢
   1¢, 3¢
   2¢, 2¢
**/
func findCombinationsOfCurrencies(currencies:Array<Int>, _ equalToAmount:Int) -> Array<Array<Int>> {
   var combinations = [Array<Int>]()
   for currency in currencies {
      
      //look for all 1's like case
      if( equalToAmount % currency == 0 ) {
         var allSame = [Int]()
         for var i = 0; i < equalToAmount / currency; i++ {
            allSame.append(currency)
         }
         combinations.append(allSame)
      }
      
      //
   }
   return combinations
//   return [[1,1,1,1], [1,1,2], [1,3], [2,2]]
}
var combinations = findCombinationsOfCurrencies([1, 2, 3], 4)
combinations == [[1,1,1,1], [1,1,2], [1,3], [2,2]]


public class Change {
   var memo = [String:Int]()
   
   public func changePossibilitiesTopDown(var amountLeft:Int, _ denominationsLeft:Array<Int>) ->Int {
      let memoKey = "\(amountLeft) \(denominationsLeft)"
      if(self.memo[memoKey] != nil) {
         print("grabbing memo[\(memoKey)]")
         return memo[memoKey]!
      }
      if(amountLeft == 0) {return 1}
      if(amountLeft < 0) {return 0}
      if(denominationsLeft.count == 0) {return 0}
      
      print("checking ways to make \(amountLeft) with \(denominationsLeft)")
      let currentCoin = denominationsLeft.first
      let restOfCoins = Array(denominationsLeft.dropFirst())
      
      var numPossibilities = 0
      while(amountLeft >= 0) {
         numPossibilities += changePossibilitiesTopDown(amountLeft, restOfCoins)
         amountLeft -= currentCoin!
      }
      memo[memoKey] = numPossibilities
      return numPossibilities
   }
}

var numPossibilities = Change().changePossibilitiesTopDown(4, [1, 2, 3])
numPossibilities == 4


//: [Next](@next)
