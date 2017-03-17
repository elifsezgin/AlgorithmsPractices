# Hamming Question
# The Hamming distance between two integers is the number of positions at which the corresponding bits are different.
#
# Given two integers x and y, calculate the Hamming distance.
#
# Input: x = 1, y = 4
#
# Output: 2
#
# Explanation:
# 1   (0 0 0 1)
# 4   (0 1 0 0)
#        ↑   ↑
#
# The above arrows point to positions where the corresponding bits are different.

def hamming_distance(x, y)
    distance = 0
    until x == y
        if x%2 != y%2
            distance += 1
        end
        x, y = x/2, y/2
    end
    return distance
end
# Number Complement
# Given a positive integer, output its complement number. The complement strategy is to flip the bits of its binary representation.
#
# Note:
# The given integer is guaranteed to fit within the range of a 32-bit signed integer.
# You could assume no leading zero bit in the integer’s binary representation.
# Input: 5
# Output: 2
# Explanation: The binary representation of 5 is 101 (no leading zero bits), and its complement is 010. So you need to output 2.
def find_complement(num)
    comp = 0
    factor = 0
    until num == 0
        comp += (2**factor) * (1 - (num % 2))
        factor += 1
        num /= 2
    end
    comp
end
# Keyboard row
# Given a List of words, return the words that can be typed using letters of alphabet on only one row's of American keyboard like the image below.

# Input: ["Hello", "Alaska", "Dad", "Peace"]
# Output: ["Alaska", "Dad"]

# You may use one character in the keyboard more than once.
# You may assume the input string will only contain letters of alphabet.

def find_words(words)
    rows = ['qwerrtyuiop', 'asdfghjkl', 'zxcvbnm']
    one_row_words = []
    words.each do |word|
        row = rows.select { |a| a.include?(word[0].downcase) }
        pass = false
        word.each_char do |letter|
            unless row[0].include?(letter.downcase)
                pass = true
                break
            end
        end
        next if pass
        one_row_words << word
    end
    one_row_words
end

# FizzBuzz

# Write a program that outputs the string representation of numbers from 1 to n.
#
# But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”. For numbers which are multiples of both three and five output “FizzBuzz”.

# n = 15,
#
# Return:
# [
#     "1",
#     "2",
#     "Fizz",
#     "4",
#     "Buzz",
#     "Fizz",
#     "7",
#     "8",
#     "Fizz",
#     "Buzz",
#     "11",
#     "Fizz",
#     "13",
#     "14",
#     "FizzBuzz"
# ]

def fizz_buzz(n)
    result = []
    n.times do |num|
        num += 1
        if num % 15 == 0
            result << 'FizzBuzz'
        elsif num % 5 == 0
            result << 'Buzz'
        elsif num % 3 == 0
            result << 'Fizz'
        else
            result << num.to_s
        end
    end
    result
end


# Reverse String
# Write a function that takes a string as input and returns the string reversed.
#
# Example:
# Given s = "hello", return "olleh".
def reverse_string(s)
    half = s.length / 2
    half.times do |idx|
        s[idx], s[s.length - idx - 1] = s[s.length - idx - 1], s[idx]
    end
    s
end
# Next Greater Element I
# You are given two arrays (without duplicates) nums1 and nums2 where nums1’s elements are subset of nums2. Find all the next greater numbers for nums1's elements in the corresponding places of nums2.
#
# The Next Greater Number of a number x in nums1 is the first greater number to its right in nums2. If it does not exist, output -1 for this number.
#
# Example 1:
# Input: nums1 = [4,1,2], nums2 = [1,3,4,2].
# Output: [-1,3,-1]
# Explanation:
#     For number 4 in the first array, you cannot find the next greater number for it in the second array, so output -1.
#     For number 1 in the first array, the next greater number for it in the second array is 3.
#     For number 2 in the first array, there is no next greater number for it in the second array, so output -1.
# Example 2:
# Input: nums1 = [2,4], nums2 = [1,2,3,4].
# Output: [3,-1]
# Explanation:
#     For number 2 in the first array, the next greater number for it in the second array is 3.
#     For number 4 in the first array, there is no next greater number for it in the second array, so output -1.
# Note:
# All elements in nums1 and nums2 are unique.
# The length of both nums1 and nums2 would not exceed 1000.

def next_greater_element(find_nums, nums)
    result = []
    find_nums.each do |el1|
        idx = nums.index(el1)
        greater_found = false
        (idx...nums.length).each do |idx2|
            if nums[idx2] > el1
                greater_found = true
                result << nums[idx2]
                break
            end
        end
        result << -1 unless greater_found
    end
    result
end

# Island Perimeter
# You are given a map in form of a two-dimensional integer grid where 1 represents land and 0 represents water. Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells). The island doesn't have "lakes" (water inside that isn't connected to the water around the island). One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.
#
# [[0,1,0,0],
#  [1,1,1,0],
#  [0,1,0,0],
#  [1,1,0,0]]
#
# Answer: 16

def island_perimeter(grid)
    islands = 0
    neighbors = 0
    grid.each_with_index do |row, idx1|
       row.each_with_index do |el, idx2|
           next unless el == 1
           islands += 1
           neighbors += 1 if idx1+1 < grid.length && grid[idx1+1][idx2] == 1
           neighbors += 1 if idx2+1 < grid[0].length && grid[idx1][idx2+1] == 1
       end
    end
    islands * 4 - neighbors * 2
end
