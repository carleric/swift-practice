//: [Previous](@previous)

import Foundation

public class Sorting {
   
   //let inputArray = [4, 8, 2, 6, 1, 3, 7, 9, 5]
   
   /**
    * O n2 always
    */
   public static func selectionSort(_ inputArray: inout [Int]) {
      for (i,item) in inputArray.enumerated() {
         var smallestIndex = i
         var min = item
         let lower = i+1
         for j in lower..<inputArray.count {
            let item2 = inputArray[j]
            if(item2 < min) {
               smallestIndex = j
            }
         }
         //a smaller value was found, swap it with the item at i
         if (min < item) {
            let temp = inputArray[i]
            inputArray[i] = inputArray[smallestIndex]
            inputArray[smallestIndex] = temp
         }
      }
   }
   
   public static func bubbleSort(_ inputArray: inout Array<Int>) {
      var flag = true
      while(flag) {
         flag = false
         for (i, item) in inputArray.enumerated() {
            if(inputArray[i] > inputArray[i+1]){
               let temp = inputArray[i]
               inputArray[i] = inputArray[i+1]
               inputArray[i+1] = temp
               flag = true
            }
         }
      }
   }
   
   public static func mergeSort(_ inputArray: inout Array<Int>, low:Int, high:Int)  {
      if(low < high) {
         //print("split low=\(low) high=\(high)")
         let mid = (low + high) / 2
         mergeSort(&inputArray, low: low, high: mid)
         mergeSort(&inputArray, low: mid+1, high: high)
         merge(&inputArray, low:low, mid:mid, high:high)
      }
   }
   
   static func merge(_ inputArray: inout Array<Int>, low:Int, mid:Int, high:Int) {
      //print("merge: low=\(low) mid=\(mid) high=\(high)")
      var helper = inputArray
      var helperLeft = low
      var helperRight = mid + 1
      var current = low
      
      while(helperLeft <= mid && helperRight <= high) {
         if(helper[helperLeft] <= helper[helperRight]){
            inputArray[current] = helper[helperLeft]
            helperLeft += 1
         }
         else {
            inputArray[current] = helper[helperRight]
            helperRight += 1
         }
         current += 1
      }
      
      let remaining = mid - helperLeft
      //for (var i=0; i<=remaining; i++){
      for i in 0..<remaining {
         inputArray[current+i] = helper[helperLeft + i]
      }
   }
   
   public static func quickSort(_ nums: inout Array<Int>, left:Int, right:Int){
      print("quick left=\(left) right=\(right)")
      var index = partition(&nums, left:left, right:right)
      if (left < index - 1){//sort left half
         quickSort(&nums, left:left, right:index-1)
      }
      if (index < right){//sort right half
         quickSort(&nums, left:index, right:right)
      }
   }
   
   static func partition(_ nums: inout Array<Int>, left:Int, right:Int) -> Int {
      var left = left
      var right = right
      print("partition left=\(left) right=\(right)")
      var pivot = nums[(left + right)/2] //pick pivot point
      while (left <= right){
         while (nums[left] < pivot) { left += 1 }
         while (nums[right] > pivot) { right -= 1 }
         
         if(left <= right){
            var tmp = nums[left]
            nums[left] = nums[right]
            nums[right] = tmp
            left += 1
            right -= 1
         }
      }
      return left
   }
}

var arr = [4, 7, 1, 8, 0, 3, 6, 2, 5, 9]
Sorting.selectionSort(&arr)
arr == [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

var arr2 = [4, 7, 1, 8, 0, 3, 6, 2, 5, 9]
//Sorting.bubbleSort(&arr2)
arr2 == [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

var arr3 = [4, 7, 1, 8, 0, 3, 6, 2, 5, 9]
//Sorting.mergeSort(&arr3, low:0, high:9)
arr3 == [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

var arr4 = [4, 7, 1, 8, 0, 3, 6, 2, 5, 9]
//Sorting.quickSort(&arr4, left:0, right:9)
arr4 == [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]



//: [Next](@next)
