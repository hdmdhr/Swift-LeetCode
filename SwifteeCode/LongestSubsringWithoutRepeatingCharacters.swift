//
//  LongestSubsringWithoutRepeatingCharacters.swift
//  SwifteeCode
//
//  Created by Daniel Hu on 2022-09-16.
//

import Foundation

/// 3. Longest Substring Without Repeating Characters
/// `https://leetcode.com/problems/longest-substring-without-repeating-characters/`
/// Runtime: 15 ms, faster than 93.28% of Swift online submissions for Longest Substring Without Repeating Characters.
/// Memory Usage: 14.5 MB, less than 65.99% of Swift online submissions for Longest Substring Without Repeating Characters.
class LongestSubsringWithoutRepeatingCharacters {
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 1 else { return s.count }
        
        var left = -1
        var right = 0
        var result = 0
        var dict: [Character: Int] = [:]
        
        for char in s {
            if let repeatIndex = dict[char],
                repeatIndex > left
            {
                left = repeatIndex
            }
            
            dict.updateValue(right, forKey: char)
            result = max(result, right - left)
            right += 1
        }
        
        return result
    }
    
}
