import random

# Number of test cases
num_tests = 100

# Open a file to write the test cases
with open("test_vectors.txt", "w") as f:
    for _ in range(num_tests):
        # Generate two 32 bit binary numbers
        A = random.randint(0, 2**32-1)
        B = random.randint(0, 2**32-1)
        excepted_sum = A + B
        # Write the test case to the file as binary
        f.write(f"{A:032b} {B:032b} {excepted_sum:032b}\n")
