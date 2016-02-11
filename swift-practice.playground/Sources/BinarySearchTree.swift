import Foundation

public class BinarySearchTree: BinaryTree {
//   public init() {
//      //super.init()
//   }
   
   public func insert(value:Int){
      self.head = insert(value, current:self.head)
      size++
   }
   
   func insert(newValue:Int, var current:BinaryNode?)->BinaryNode{
      if(current == nil) {
         current = BinaryNode(data:newValue)
      } else if(newValue < current!.data) {
         current!.leftChild = insert(newValue, current:current!.leftChild);
      } else {
         current!.rightChild = insert(newValue, current:current!.rightChild);
      }
      return current!
   }
   
}
