## Find the magic number

The goal is to find the smallest number (let's call it **M**) that satisfies:

- If property X is verified, then digit X is part of the number.
- If property X is not verified, then digit X is NOT part of the number.

For example, 2457 would have to verify properties 2, 4, 5, 7 while not verifying 0, 1, 3, 6, 8, 9. It's not actually the case, so it's not the number we are looking for.

### Properties

- **0**. One of the digits of M is the sum of the others (examples: 6321 as 6 = 3 + 2 + 1).
- **1**. The sum of the divisors of M is greater than M (examples: 2 as 1 + 2 > 2).
- **2**. M has at least 2 odd digits (examples: 123, 129546).
- **3**. All digits are different (examples: 1456).
- **4**. The 4th digit is even (examples: 1234, 543874).
- **5**. The product of all digits is not a multiple of 5 (examples: 144).
- **6**. The number contains 3 odd digits in a row (example: 23578).
- **7**. M is a prime number (examples: 7, 23).
- **8**. M has at least 2 even digits in a row (examples: 22, 124576).
- **9**. The product of all odd digits is a square number (1299 as 1 * 9 * 9 = 81).
