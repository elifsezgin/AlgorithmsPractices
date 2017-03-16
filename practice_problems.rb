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
