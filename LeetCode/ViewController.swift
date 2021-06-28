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
        print(sortedSquares([-7,-3,2,3,11]))
    }
    
    // MARK: - findMaxConsecutiveOnes
    /*
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

*/
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
}

