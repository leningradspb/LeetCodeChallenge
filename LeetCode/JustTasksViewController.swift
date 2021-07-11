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

//       print(reverse(-120))
//        let pow = pow(2, 32)
        
//        print(romanToInt("LVIII"))
//        print(romanToInt("IX"))
//        print(singleNumber([2,2,1]))
//        print(singleNumber([4,1,2,1,2]))
//        print(longestCommonPrefix(["dog","dacecar","dar"]))
        
        maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
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
    
    // MARK: - Roman to Integer
    
    func romanToInt(_ s: String) -> Int {
        let dict = ["M":1000, "CM":900, "D": 500, "CD": 400, "C": 100, "XC": 90, "L": 50, "XL": 40, "X": 10, "IX": 9, "V": 5, "IV": 4, "I": 1]

        let array = Array(s)
        var sum = 0
        var index = 0
        var nextIndex = 1
        
        while nextIndex < s.count {
            let character = array[index]
            let nextCharacter = array[index + 1]
            let joinedCharacters = String(character) + String(nextCharacter)
            if let key = dict.keys.first(where: { $0 == joinedCharacters }) {
                sum += dict[key]!
                index += 2
                nextIndex += 2
            } else {
                if let key = dict.keys.first(where: { $0 == String(character) }) {
                    sum += dict[key]!
                }
                index += 1
                nextIndex += 1
            }
        }
        
        if index < s.count {
            let character = array[index]
            if let key = dict.keys.first(where: { $0 == String(character) }) {
                sum += dict[key]!
            }
        }
        return sum
    }
    
    // MARK: - Single Number v1
    
   /* func singleNumber(_ nums: [Int]) -> Int {
        for v in nums {
            if let firstIndex = nums.firstIndex(where: {$0 == v}) {
                if firstIndex == nums.lastIndex(where: {$0 == v}) {
                    return nums[firstIndex]
                }
            }
        }
        return 0
    }
     */
    
    // MARK: - Single Number v2 (подсмотрел)
    
//    func singleNumber(_ nums: [Int]) -> Int {
//        return nums.reduce(0, ^)
//    }
    
    // MARK: - Single Number v3 RECURSIVE
   // https://leetcode.com/problems/single-number/
//    func singleNumber(_ nums: [Int]) -> Int {
//
//        if nums.count < 2 {
//            return nums[0]
//        } else {
//            for index in 0..<nums.count {
//                let nextValues = Array(nums[index + 1..<nums.count])
//                if nextValues.contains(nums[index]) {
//                    var newNums = nums
//                    newNums.removeAll(where: {$0 == nums[index] })
//                    print(newNums)
//                    return singleNumber(newNums)
//                }
//            }
//        }
//        return nums[0]
//    }
    // MARK: - Single Number v4
    func singleNumber(_ nums: [Int]) -> Int {
        var counter = 0
        var cache = nums
        for num in nums {
            while cache.contains(num) {
                cache.remove(at: cache.firstIndex(where: {$0 == num})!)
                counter += 1
            }
            
            if counter == 1 {
                return num
            } else {
                counter = 0
            }
        }
        return 0
    }
    
    // MARK: - Longest Common Prefix
//    func longestCommonPrefix(_ strs: [String]) -> String {
//        if strs.count < 2 {
//            return strs.first ?? ""
//        }
//
//        var matches = 0
//        let first = strs[0]
////        for character in first {
//            for index in 1..<strs.count {
//                var word = strs[index]
//                var firstCache = first
//                var localMatches = 0
//                while word.first == firstCache.first && !word.isEmpty && !firstCache.isEmpty {
//                    word.removeFirst()
//                    firstCache.removeFirst()
//                    localMatches += 1
//                    print(word, firstCache, localMatches, matches)
////                    matches = max(localMatches, matches)
//                }
//                matches = min(matches, max(localMatches - 1, 0))
////                if matches == 0 {
////                    matches = localMatches
////                } else {
////                    matches = min(matches, max(localMatches - 1, 0))
//////                    if localMatches > 0 {
//////                        matches = min(matches, max(localMatches - 1, 0))
//////                    } else {
//////                        matches = max(matches, max(localMatches - 1, 0))
//////                    }
////
////                }
//            }
////        }
//        return matches > 0 ? String(Array(first)[0...matches]) : ""
//        }
    /// cam
  /*  func longestCommonPrefix(_ strs: [String]) -> String {
    
        if strs.count < 2 || strs.count > 200 {
            return strs.first ?? ""
        }
//        print(strs.sorted(by: {$0.count < $1.count}))
        var strSorted = strs.sorted(by: {$0.count < $1.count})
        strSorted.removeAll(where: {$0.count > 200})
        let first = Array(strSorted[0])
        guard !first.isEmpty else { return "" }
        var matches: [Int] = []
        
        
        for index in 1..<strSorted.count {
            let word = Array(strSorted[index])
            
            for _ in 0..<first.count {
                var index = 0
                while index < first.count && first[index] == word[index] {
                    print(first[index], word[index], matches)
                    index += 1
                }
                matches.append(index)
            }
        }
        
        print(matches)
    
//        let array = Array(strs[1..<strs.count])
        let min = matches.min() ?? 1
        let s = String(first[0..<min])
        return s
    }*/
    // нашел более изящное (подсмотрел, не знал про allSatisfy)
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard var `prefix` = strs.min() else { return "" }
        while `prefix`.isEmpty == false {
            if strs.allSatisfy({ $0.hasPrefix(`prefix`) }) { break }
            `prefix`.removeLast()
        }
        return `prefix`
    }
    
    // MARK: - Maximum Subarray
    func maxSubArray(_ nums: [Int]) -> Int {
        var result = Int.min
        var num: Int = 0
        for index in 0..<nums.count {
            num = max(nums[index], num + nums[index])
            result = max(num, result)
            
        }
        return result
    }
}
