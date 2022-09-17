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
    
    /// Runtime: 59 ms, faster than 32.64% of Swift online submissions for Longest Substring Without Repeating Characters.
    /// Memory Usage: 14.4 MB, less than 87.87% of Swift online submissions for Longest Substring Without Repeating Characters.
    func lengthOfLongestSubstring_2(_ s: String) -> Int {
        guard s.count > 1 else { return s.count }
        
        var left = s.startIndex
        var right = s.startIndex
        var result = 0
        var dict: [Character: String.Index] = [:]
        
        while right < s.endIndex {
            if let repeatIndex = dict[s[right]], repeatIndex >= left {
                left = s.index(after: repeatIndex)
            }
            
            dict.updateValue(right, forKey: s[right])
            // `.distance` has O(n) time complexity, which is bad
            result = max(result, s.distance(from: left, to: right) + 1)
            right = s.index(right, offsetBy: 1)
        }
        
        return result
    }
    
}
