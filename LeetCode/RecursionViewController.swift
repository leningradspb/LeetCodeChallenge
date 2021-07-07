//
//  RecursionViewController.swift
//  LeetCode
//
//  Created by Eduard Sinyakov on 07.07.2021.
//

import UIKit

class RecursionViewController: UIViewController {
    // ["H","a","n","n","a","h"]
    var s: [Character] = ["h","e","l","l","o"]
//    var s: [Character] = ["1","2","3","4","5","6"]
    var firstIndex = 0
    var lastIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reverseString(&s)
    }

    // MARK: - Reverse String
    func reverseString(_ s: inout [Character]) {
        let isEven = s.count % 2 == 0
        if lastIndex == nil {
            lastIndex = s.count - 1
        }
        
        if isEven {
            if firstIndex > lastIndex! {
                return
            }
        } else {
            if firstIndex == lastIndex {
                return
            }
        }
        
        
        let last = s[lastIndex!]
        let first = s[firstIndex]
        s[firstIndex] = last
        s[lastIndex!] = first
        firstIndex += 1
        lastIndex! -= 1
        print("s = \(s), firstIndex = \(firstIndex), lastIndex = \(lastIndex)")
        reverseString(&s)
    }
    
    // MARK: - Swap Nodes in Pairs (сам не решил, но и не сильно пытался. Счел задание далеким от реальности)
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
    
    lazy var fourth = ListNode(4, nil)
    lazy var third = ListNode(3, fourth)
    lazy var second = ListNode(2, third)
    lazy var head = ListNode(1, second)
    
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let node = ListNode(0)
        node.next = head
        var prev = node
        var current = head
        
        while prev != nil && current?.next != nil {
            let next = current!.next
            let post = current!.next!.next
            
            prev.next = next
            next!.next = current
            current!.next = post
            
            prev = current!
            current = post
        }
        
        return node.next
    }


}
