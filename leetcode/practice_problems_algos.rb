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
