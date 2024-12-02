# Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.
# The overall run time complexity should be O(log (m+n)).

# Example 1:
# Input: nums1 = [1,3], nums2 = [2]
# Output: 2.00000
# Explanation: merged array = [1,2,3] and median is 2.

# Example 2:
# Input: nums1 = [1,2], nums2 = [3,4]
# Output: 2.50000
# Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  concatedNums = nums1.concat(nums2).sort
  avgPosition = concatedNums.length.to_f/2
  if avgPosition == avgPosition.to_i
      return (concatedNums[avgPosition] + concatedNums[avgPosition-1]).to_f/2
  else
      return concatedNums[avgPosition.floor]
  end
end