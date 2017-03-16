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
