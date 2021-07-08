//
//  JustTasksViewController.swift
//  LeetCode
//
//  Created by Eduard Sinyakov on 08.07.2021.
//

import UIKit

class JustTasksViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       print(reverse(-120))
        let pow = pow(2, 32)
    }
    
    // MARK: - Two Sum (easy) v1
//    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        guard nums.count > 0 else { return [] }
//        var indexes: [Int] = []
//        for index in 0..<nums.count {
//            let element = target - nums[index]
//            if nums.contains(element) {
//                if let fIndex: Int = nums.firstIndex(where: {$0 == element}) {
//                    if index != fIndex {
//                        indexes = [index, fIndex]
//                    } else {
//                        if let lIndex = nums.lastIndex(where: {$0 == element}) {
//                            indexes = [index, lIndex]
//                        }
//                    }
//                }
//            }
//        }
//        return indexes
//    }
    // MARK: - Two Sum (easy) v2
//    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        guard nums.count > 0 else { return [] }
//        var indexes: [Int] = []
//        var searchedIndex: Int = 1
//        for index in 0..<nums.count {
////            print(searchedIndex)
//            while searchedIndex < nums.count && target - nums[index] != nums[searchedIndex] {
//                print(index, searchedIndex)
//                searchedIndex += 1
//            }
//
//            if searchedIndex == nums.count {
//                searchedIndex = index + 2
//            } else {
//                if target - nums[index] == nums[searchedIndex] {
//                    print(index, searchedIndex)
//                    indexes = [index, searchedIndex]
//                    return indexes
//                }
//            }
//
//        }
//        return indexes
//    }
    
    // MARK: - Two Sum (easy) v3
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 0 else { return [] }
        var indexes: [Int] = []
//        var searchedIndex: Int = 1
        for index in 0..<nums.count {
            let value = nums[index]
            let nextIndex = index + 1
            if nextIndex < nums.count {
                for searchedIndex in nextIndex..<nums.count {
                    if target - nums[searchedIndex] == value {
                        indexes = [index, searchedIndex]
                        return indexes
                    }
                }
            }
        }
        return indexes
    }
     
    // MARK: - Reverse Integer (easy) v1 (сам)
//    func reverse(_ x: Int) -> Int {
//        var strX = "\(x)"
//        while strX.last == "0" {
//            strX.removeLast()
//        }
////        strX = strX.replacingOccurrences(of: "0", with: "")
//        strX = String(strX.reversed())
//        if strX.last == "-" {
//            strX.removeLast()
//            strX = "-" + strX
//        }
//        print(strX)
//        if let intFromStr = Int(strX) {
//            return intFromStr
//        } else {
//            return 0
//        }
//
//    }
    
    // MARK: - Reverse Integer (easy) v1 (нашел вариант лучше)
    func reverse(_ x: Int) -> Int {
        var strX = "\(abs(x))"
        strX = String(strX.reversed())
       
        if let intStr = Int(strX) {
            // условие задачи
            if intStr > Int(truncating: NSDecimalNumber(decimal: (pow(2, 31) - 1))) {
                return 0
            }
            return x < 0 ? intStr * -1 : intStr
        } else {
            return 0
        }
    }
    
    // MARK: - Palindrome Number (easy)
    func isPalindrome(_ x: Int) -> Bool {
        let strOriginal = "\(x)"
        let reversedStr = String(strOriginal.reversed())
        return strOriginal == reversedStr
    }
}
