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

}
