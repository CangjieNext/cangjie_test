import sys

a = int(sys.argv[1])
b = int(sys.argv[2])

print(f'sys.argv[1] = {a}, sys.argv[2] = {b}')

if a - b > 0:
    exit(0)
else:
    exit(1)
