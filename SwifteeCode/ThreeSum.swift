//
//  ThreeSum.swift
//  SwifteeCode
//
//  Created by Daniel Hu on 2022-09-16.
//

import Foundation

/// 15. 3Sum
/// `https://leetcode.com/problems/3sum/`
/// Runtime: 142 ms, faster than 84.30% of Swift online submissions for 3Sum.
/// Memory Usage: 18 MB, less than 71.14% of Swift online submissions for 3Sum.
class ThreeSum {
    
    private func twoSum(to targetValue: Int, sortedNumsSlice sortedSlice: ArraySlice<Int>) -> [[Int]] {
        var results: [[Int]] = []
        var left = sortedSlice.startIndex
        var right = sortedSlice.endIndex - 1
        
        while left < right {
            let sum = sortedSlice[left] + sortedSlice[right]
            if sum > targetValue {
                right -= 1
            } else {
                if sum == targetValue {
                    results.append([sortedSlice[left], sortedSlice[right]])
                }
                
                left += 1
            }
        }
        
        return results
    }
    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        var resultsSet: Set<[Int]> = []
        let sortedNums = nums.sorted(by: <)
        let count = nums.count
        
        guard sortedNums.first! <= 0 && sortedNums.last! >= 0 else { return [] }
        
        for (i, num) in sortedNums.enumerated() {
            if i > 0, num == sortedNums[i - 1] {
                continue
            }
            
            let numArray = [num]
            let twoSumResults = twoSum(to: 0 - num, sortedNumsSlice: sortedNums.suffix(count - i - 1))
            let threeSumResults = twoSumResults.map{ numArray + $0 }
            for result in threeSumResults {
                // do not append duplicated answer to results
                if resultsSet.insert(result).inserted {
                    results.append(result)
                }
            }
        }
        
        return results
    }
    
}
