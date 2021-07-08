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

       print(twoSum([2, 5, 5, 11], 10))
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
}
