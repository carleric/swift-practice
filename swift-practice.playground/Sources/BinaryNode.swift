import Foundation

public class BinaryNode {
   
   var data:Int
   var leftChild:BinaryNode?
   var rightChild:BinaryNode?
   
   init(data:Int){
      self.data = data
   }
   
   func visit(){
      NSLog("data: \(self.data) ")
   }
}