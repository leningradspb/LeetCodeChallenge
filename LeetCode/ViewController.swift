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
        print(findNumbers([555,900_000_000,4820,1771]))
//        print(13 % 2)
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
}

