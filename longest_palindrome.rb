# Given a string s, return the longest palindromic substring in s.

# Example 1:
# Input: s = "babad"
# Output: "bab"
# Explanation: "aba" is also a valid answer.

# Example 2:
# Input: s = "cbbd"
# Output: "bb"
 
# Constraints:
# 1 <= s.length <= 1000
# s consist of only digits and English letters.


# @param {String} s
# @return {String}
def longest_palindrome(s)
  return s if s.length < 2
  substring_indexes = {from: 0, to: 0, length: 1}

  substring_indexes = (0...s.length).reduce(substring_indexes) do |result, index|
      _indexes = search_palindromic_from_center(s, index)
      result = _indexes if _indexes[:length] > result[:length]
      result
  end
  
  s[substring_indexes[:from], substring_indexes[:length]]
end

# @param {String} s
# @param {Integer} index
# @return {Hash} {from: {Integer}, to: {Integer}, length: {Integer}}
def search_palindromic_from_center(s, index)
  even_palindromic = search_palindromic_by_indexes(s, index, index+1)
  odd_palindromic = search_palindromic_by_indexes(s, index, index)
  even_palindromic[:length] > odd_palindromic[:length] ? even_palindromic : odd_palindromic
end

# @param {String} s
# @param {Integer} left
# @param {Integer} rigth
# @return {Hash} {from: {Integer}, to: {Integer}, length: {Integer}}
def search_palindromic_by_indexes(s, left, right)
  while left >= 0 && right < s.length && s[left] == s[right]
      left -= 1
      right += 1
  end
  {from: left+1, to: right-1, length: right - left - 1}
end