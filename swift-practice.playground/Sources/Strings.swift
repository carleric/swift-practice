import Foundation

public class Strings {
   public static func reverseWordsInString(inputString:String)->String{
      var words = inputString.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
      let numWords = words.count
      
      for var i = 0; i < numWords/2; i++ {
         let temp = words[i]
         words[i] = words[numWords-1-i]
         words[numWords-1-i] = temp
      }
      return words.joinWithSeparator(" ")
   }
   
   /**
    * insert newlines in a string in between word breaks honoring a maximum line length.  
    * preserve any existing line breaks (paragraphs)
   **/
   public static func insertLineBreaksInString(inputString:String, maxLineLength:Int)->String{
      var outputString:String = ""
      
      //first break input into existing paragraphs
      let paragraphs = inputString.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
      for paragraph in paragraphs {
         var currentLineLength = 0
         let words = paragraph.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
         for word:String in words {
            if(word.characters.count + currentLineLength > maxLineLength){
               currentLineLength = 0
               outputString.appendContentsOf("\n")
            }
            outputString.appendContentsOf(" \(word)")
            currentLineLength += word.characters.count + 1
         }
         
         //re-insert newline for paragraph
         outputString.appendContentsOf("\n")
      }
      return outputString
   }
}