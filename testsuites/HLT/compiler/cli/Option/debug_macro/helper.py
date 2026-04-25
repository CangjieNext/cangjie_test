import sys

def main() -> None:
    file_path = sys.argv[1]
    with open(file_path, 'r', encoding='utf-8', newline='') as f:
        content = f.read()
    
    content = content.replace('\r', '')

    with open(file_path, 'w', encoding='utf-8', newline='') as f:
        f.write(content)

if __name__ == '__main__':
    main()
