import sys

result_file_path = sys.argv[1]
with open(result_file_path, 'r', encoding='utf-8') as f:
    content = f.read()

if content:
    sys.exit(0)
else:
    sys.exit(1)
