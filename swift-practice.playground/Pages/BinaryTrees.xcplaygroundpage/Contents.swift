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


var bst = BinarySearchTree()
bst.insert(5)
bst.insert(3)
bst.insert(8)
bst.insert(2)
bst.size == 4

bst.preOrderVisit() == [5, 3, 2, 8]    //expect true
bst.inOrderVisit() == [2, 3, 5, 8]     //expect true
bst.postOrderVisit() == [2, 3, 8, 5]   //expect true
