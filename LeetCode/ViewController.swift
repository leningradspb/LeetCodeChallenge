//
//  ViewController.swift
//  LeetCode
//
//  Created by Eduard Sinyakov on 11.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(findMaxConsecutiveOnes(nums))
//        print(sortedSquares([-7,-3,2,3,11]))
//        print(findNumbers([555,900_000_000,4820,1771]))
//        print(13 % 2)
//        var array = [0,1,7,6,0,2,0,7]
//        duplicateZeros(&array)
//        print(array)
        
//        merge(&array, 3, [2,3,5], 3)
    }
    
    // MARK: - findMaxConsecutiveOnes
    
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
     let nums = [1,1,0,1,1,1]
        // MARK: - второй вариант
        /*var consecutive: [Int] = []
         var cahche: [Int] = []
         nums.forEach {
             if $0 == 1 {
                 cahche.append($0)
                 if consecutive.count < cahche.count {
                     consecutive = cahche
                 }
                 
             } else {
                 if consecutive.count < cahche.count {
                     consecutive = cahche
                 }
                 cahche.removeAll()
             }
         }
         return consecutive.count */
        
        
        // MARK: - первый вариант
        var consecutive: [Int] = []
        var cahche: [Int] = []
        for index in 0..<nums.count {
            let value = nums[index]
            if value == 1 {
                cahche.append(value)
                if index == nums.count - 1 {
                    if consecutive.count < cahche.count {
                        consecutive = cahche
                    }
                }
            } else {
                if consecutive.count < cahche.count {
                    consecutive = cahche
                }
                cahche.removeAll()
            }
        }
        return consecutive.count
        
        /* верный
         var globalMax = 0, localMax = 0
                 
                 for num in nums {
                     if num == 1 {
                         localMax += 1
                         globalMax = max(globalMax, localMax)
                     } else {
                         localMax = 0
                     }
                 }
                 
                 return globalMax
         */
    }

    // MARK: - findMaxConsecutiveOnes end
    // сделал с первого раза
    // MARK: - Squares of a Sorted Array
    // nums = [-7,-3,2,3,11]
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var newValues: [Int] = []
        nums.forEach {
            newValues.append($0 * $0)
        }
        return newValues.sorted()
    }
    // MARK: - Squares of a Sorted Array end
    
    
    // MARK: - Find Numbers with Even Number of Digits (двузначное, трехзначное и тд) нужно найти четные значения (2 знака (12), 4 знака(1000, 6 знаков(123456)
    func findNumbers(_ nums: [Int]) -> Int {
        var count: Int = 0
        nums.forEach {
            let length = "\($0)".count
            if length % 2 == 0 {
                count += 1
            }
        }
        /*for num in nums {
            let length = "\(num)".count
            if length % 2 == 0 {
                count += 1
            }
            print(length)
        }*/
        return count
    }
    // MARK: - Find Numbers with Even Number of Digits end
    
    // MARK: - Duplicate Zeros
    func duplicateZeros(_ arr: inout [Int]) {
        var index: Int = 0
        var count = 1
        
        for value in arr {
            if value == 0 && index + count < arr.count {
                arr.insert(0, at: index + count)
                arr.removeLast()
                count += 1
            }
            index += 1
        }
        
        /* резерв
         var index: Int = 0
         var indexes: [Int] = []
         
         for value in arr {
         if value == 0 {
         indexes.append(index)
         }
         index += 1
         }
         var count = 1
         indexes.forEach {
         if $0 != arr.count - 1 && $0 + count < arr.count {
         
         arr.insert(0, at: $0 + count)
         arr.removeLast()
         count += 1
         }
         }
         */
        
    }
    // MARK: - Duplicate Zeros end
    
    // MARK: - Merge Sorted Array
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
// var array = [1,2,3,0,0,0]
        if m == 0 {
            nums1.removeAll()
        } else {
            for _ in m..<nums1.count {
                nums1.removeLast()
            }
        }
        nums1 += nums2
        
        nums1 = nums1.sorted()
    }
    // MARK: - Merge Sorted Array - end
}

