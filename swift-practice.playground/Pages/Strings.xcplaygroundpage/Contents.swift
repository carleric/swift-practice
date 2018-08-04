//: [Previous](@previous)

import Foundation

public class Strings {
   
   /**
    * reverse the order of words in a string
    **/
   public static func reverseWordsInString(_ inputString:String)->String{
      var words = inputString.components(separatedBy: .whitespaces)
      let numWords = words.count
      
      for i in 0 ..< numWords/2 {
         let temp = words[i]
         words[i] = words[numWords-1-i]
         words[numWords-1-i] = temp
      }
      return words.joined(separator: " ")
   }
   
   /**
    * insert newlines in a string in between word breaks honoring a maximum line length.
    * preserve any existing line breaks (paragraphs)
    **/
   public static func insertLineBreaksInString(_ inputString:String, maxLineLength:Int)->String{
      var outputString:String = ""
      
      //first break input into existing paragraphs
      let paragraphs = inputString.components(separatedBy: .newlines)
      for paragraph in paragraphs {
         var currentLineLength = 0
         let words = paragraph.components(separatedBy: .whitespaces)
         for word:String in words {
            if(word.count + currentLineLength > maxLineLength){
               outputString.append("\n")
               outputString.append(word)
               currentLineLength = word.count
            } else if(currentLineLength == 0){
               outputString.append(word)
               currentLineLength += word.count
            } else {
               outputString.append(" \(word)")
               currentLineLength += word.count + 1
            }
         }
         outputString.append("\n")
      }
      return outputString.trimmingCharacters(in: .whitespacesAndNewlines)
   }
   
   /**
   * test an array of strings to see if it contains any member that matches 
   * the test expression.  '.' is an wildcard
   **/
   public static func arrayContainsMatch(_ inputArray:Array<String>, _ match:String)->Bool{
      print(inputArray)
      for str:String in inputArray {
         if(str.count != match.count) { break }
         var matchCount = 0
         //for var i = str.startIndex; i < str.endIndex; i = i.advancedBy(1) {
         for i in 0 ..< str.count {
            let iStr = str.index(str.startIndex, offsetBy: i)
            let iMatch = match.index(match.startIndex, offsetBy: i)
            if(str[iStr] == match[iMatch] || match[iMatch] == ".") {
               matchCount += 1
            }
         }
         if(matchCount == match.characters.count) {
            return true
         }
      }
      return false
   }
}


/**
* tests
**/

var words = "let there be sunshine in February"
Strings.reverseWordsInString(words) == "February in sunshine be there let" //expect true

var text1 = "fun times with swift it is like time stands still"
var flowed = Strings.insertLineBreaksInString(text1, maxLineLength:9)
flowed == "fun times\nwith swift\nit is like\ntime\nstands\nstill" //expect true

var flowed2 = Strings.insertLineBreaksInString(text1, maxLineLength:20)
flowed2 == "fun times with swift\nit is like time\nstands still" //expect true

var text2 = "fun times\nwith swift it is like time stands still"
var flowed3 = Strings.insertLineBreaksInString(text2, maxLineLength:15)
flowed3 == "fun times\nwith swift it is\nlike time stands\nstill" //expect true

var array1 = ["foo", "bar", "zoo", "noo", "char"]
Strings.arrayContainsMatch(array1, "foo") //expect true
Strings.arrayContainsMatch(array1, "fo.") //expect true
Strings.arrayContainsMatch(array1, "..r") //expect true
Strings.arrayContainsMatch(array1, "..rg") //expect false
Strings.arrayContainsMatch(array1, "food") //expect false


//: [Next](@next)
