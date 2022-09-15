//
//  ContainerWithMostWater.swift
//  
//
//  Created by Daniel Hu on 2022-09-15.
//

import Foundation

/// LeetCode 11. Container With Most Water
/// `https://leetcode.com/problems/container-with-most-water/`
/// Runtime: 600 ms, faster than 93.91% of Swift online submissions for Container With Most Water.
/// Memory Usage: 18.5 MB, less than 14.41% of Swift online submissions for Container With Most Water.
public class ContainerWithMostWater {
    
    private func calculateArea(array: [Int], left: Int, right: Int) -> Int {
        min(array[left], array[right]) * abs(right - left)
    }
    
    func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.endIndex - 1
        var maxArea = 0
        
        while left <= right {
            maxArea = max(maxArea, calculateArea(array: height, left: left, right: right))
            let isLeftShorter = height[left] <= height[right]
            if isLeftShorter {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return maxArea
    }
    
}
