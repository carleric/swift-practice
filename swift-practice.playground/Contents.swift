import UIKit

var bst = BinarySearchTree()
bst.insert(5)
bst.insert(3)
bst.insert(8)
bst.insert(2)
bst.size == 4

bst.preOrderVisit() == [5, 3, 2, 8]    //expect true
bst.inOrderVisit() == [2, 3, 5, 8]     //expect true
bst.postOrderVisit() == [2, 3, 8, 5]   //expect true


var words = "let there be sunshine in February"
Strings.reverseWordsInString(words) == "February in sunshine be there let" //expect true


var flowed = Strings.insertLineBreaksInString("fun times with swift it's like time stands still", 9)
flowed == "fun times \nwith swift \nit's like \ntime stands \nstill" //expect true