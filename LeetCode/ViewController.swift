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
//        checkIfExist([-2,0,10,-19,4,6,-8])
        
//        var arr = [1,1,2,2]
//        var arr = [0,1,0,3,12]
//        moveZeroes(&arr)
//        let arr = [4,3,2,7,8,2,3,1]
        let arr = [10,2,5,10,9,1,1,4,3,7]
        print(findDisappearedNumbers(arr))
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
    
    // MARK: - Remove Element
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        nums.removeAll(where: {$0 == val})
        return nums.count
    }
    // MARK: - Remove Element - end
    
    // MARK: - Remove Duplicates from Sorted Array
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var cache: [Int] = []
        nums.forEach {
            if !cache.contains($0) {
                cache.append($0)
            }
        }
        nums = cache
        return nums.count
    }
    // MARK: - Remove Duplicates from Sorted Array - end
    
    // MARK: - Check If N and Its Double Exist
    func checkIfExist(_ arr: [Int]) -> Bool {
        var isContains = false
        if arr.firstIndex(of: 0) != arr.lastIndex(of: 0) {
            isContains = true
        }
        
        arr.forEach {
            if $0 != 0, arr.contains($0 * 2) {
                print($0)
                isContains = true
                return
            }
        }
        return isContains
    }
    // MARK: - Check If N and Its Double Exist - end
    
    // MARK: - Valid Mountain Array
    func validMountainArray(_ arr: [Int]) -> Bool {
        var isMountain = false
        var isUp = true
        guard arr.count > 2 else { return false }
        
        for index in 0..<arr.count {
            if isUp {
                if index == arr.count - 1 {
                    return arr[index - 1] > arr[index]
                }
                
                if arr[index] < arr[index + 1] {
                    isMountain = true
                } else if arr[index] > arr[index + 1] {
                    if index == 0 {
                        return false
                    }
                    isUp = false
                } else {
                    return false
                }
                
            } else {
                if index == arr.count - 1 {
                    if arr[index] < arr[index - 1] {
                        return true
                    } else {
                        return false
                    }
                }
                
                if arr[index] > arr[index + 1] {
                    isMountain = true
                } else {
                    return false
                }
            }
        }
        
        return isMountain && !isUp
    }
    // MARK: - Valid Mountain Array - end
    
    // MARK: - Replace Elements with Greatest Element on Right Side
    func replaceElements(_ arr: [Int]) -> [Int] {
        guard arr.count > 1 else { return [-1] }
        var mutableArray = arr
        for index in 0..<mutableArray.count {
            if index == mutableArray.count - 1 {
                mutableArray[index] = -1
            } else {
                var cache: Int?
                for value in index + 1..<mutableArray.count {
                    if cache == nil {
                        cache = mutableArray[value]
                    } else {
                        if cache! < mutableArray[value] {
                            cache = mutableArray[value]
                        }
                    }
                }
                mutableArray[index] = cache!
            }
        }
        return mutableArray
    }
    // MARK: - Replace Elements with Greatest Element on Right Side - end
    
    // MARK: - Move Zeroes
    func moveZeroes(_ nums: inout [Int]) {
        var counter = 0
        for index in 0..<nums.count {
            if index - counter >= 0, nums[index - counter] == 0 {
                nums.insert(0, at: nums.count)
                nums.remove(at: index - counter)
                counter += 1
            }
        }
    }
    // MARK: - Move Zeroes - end
    
    // MARK: - Sort Array By Parity
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        var evens: [Int] = []
        var odds: [Int] = []
        for num in nums {
            if num % 2 == 0 {
                evens.append(num)
            } else {
                odds.append(num)
            }
        }
        return evens + odds
    }
    // MARK: - Sort Array By Parity - end
    
    // MARK: - Height Checker
    func heightChecker(_ heights: [Int]) -> Int {
        let sortedArray = heights.sorted()
        var counter = 0
        for index in 0..<heights.count {
            if sortedArray[index] != heights[index] {
                counter += 1
            }
        }
        
        return counter
    }
    // MARK: - Height Checker - end
    
    // MARK: - Third Maximum Number
    func thirdMax(_ nums: [Int]) -> Int {
        var filteredArray: [Int] = []
        nums.forEach {
            if !filteredArray.contains($0) {
                filteredArray.append($0)
            }
        }
        
        filteredArray = filteredArray.sorted()
        var maxNumber = 0
        
        if filteredArray.count < 3 {
            filteredArray.forEach {
                maxNumber = max(maxNumber, $0)
            }
        } else {
            for v in 0...1 {
               let max = filteredArray.max()!
                filteredArray.removeAll(where: {$0 == max})
            }
            maxNumber = filteredArray.max()!
        }
        
        return maxNumber
        }
    // MARK: - Third Maximum Number - end
    
    // MARK: - Find All Numbers Disappeared in an Array

//    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
//        let sortedArray = nums.sorted()
//        var disappearedNumbers: [Int] = []
//        // [4,3,2,7,8,2,3,1]
//        for index in 0..<sortedArray.count {
//            let element = sortedArray[index]
//            print(element, index + 1)
//            if element != index + 1 {
//                if disappearedNumbers.contains(element) {
//                    disappearedNumbers.removeAll(where: { $0 == element})
//                    disappearedNumbers.append(index + 1) // index + 1
//                    print("element = \(element), index = \(index + 1) sortedArray = \(sortedArray), disappearedNumbers = \(disappearedNumbers)")
//
//                } else {
//                    disappearedNumbers.append(index + 1) // index + 1
//                    print("element = \(element), index = \(index + 1) sortedArray = \(sortedArray), disappearedNumbers = \(disappearedNumbers)")
//
//                }
//            }
////            else {
////                if disappearedNumbers.contains(index + 1) {
////                    disappearedNumbers.removeAll(where: { $0 == index + 1 })
////                }
////            }
//        }
//        return disappearedNumbers
//    }
    
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        let sortedArray = nums.sorted()
        var disappearedNumbers: [Int] = []
        for index in 0..<sortedArray.count {
            if !sortedArray.contains(index + 1) {
                disappearedNumbers.append(index + 1)
            }
        }
        return disappearedNumbers
    }
    
    // MARK: - Find All Numbers Disappeared in an Array - end
}

