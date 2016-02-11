import Foundation

public class BinaryTree {
   var head:BinaryNode?
   public var size = 0
   
   public init() {}
   
   public func preOrderVisit()->Array<Int>{
      if(self.head == nil) { return [] }
      var preOrdered:Array<Int> = []
      preOrderVisit(self.head!, &preOrdered)
      return preOrdered
   }
   
   func preOrderVisit(n:BinaryNode?, inout _ preOrdered:Array<Int>){
      if(n == nil) { return }
      preOrdered.append(n!.data)
      preOrderVisit(n!.leftChild, &preOrdered)
      preOrderVisit(n!.rightChild, &preOrdered)
   }
   
   
   public func inOrderVisit()->Array<Int>{
      if(self.head == nil) { return [] }
      var ordered:Array<Int> = []
      inOrderVisit(self.head!, &ordered)
      return ordered
   }
   
   func inOrderVisit(n:BinaryNode?, inout _ ordered:Array<Int>){
      if(n == nil) { return }
      inOrderVisit(n!.leftChild, &ordered)
      ordered.append(n!.data)
      inOrderVisit(n!.rightChild, &ordered)
   }
   
   
   public func postOrderVisit()->Array<Int>{
      if(self.head == nil) { return [] }
      var ordered:Array<Int> = []
      postOrderVisit(self.head!, &ordered)
      return ordered
   }
   
   func postOrderVisit(n:BinaryNode?, inout _ ordered:Array<Int>){
      if(n == nil) { return }
      postOrderVisit(n!.leftChild, &ordered)
      postOrderVisit(n!.rightChild, &ordered)
      ordered.append(n!.data)
   }
   
   
}
