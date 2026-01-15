from pathlib import Path

OLD_PATTERN = "@Test"
NEW_BLOCK = """@Test
class test_01{
    @TestCase"""

def process_file(file_path: Path):
    try:
        content = file_path.read_text(encoding='gbk', errors='ignore') 
        
        if OLD_PATTERN in content:
            new_content = content.replace(OLD_PATTERN, NEW_BLOCK)
            
            if not new_content.endswith('\n'):
                new_content += '\n'
            new_content += '}'
            
            file_path.write_text(new_content,encoding='gbk', errors='ignore')
            print(f": {file_path}")
        else:
            print(f"else")
            
    except Exception as e:
        print(f"error: {file_path}, {e}")

def main(folder_path: str, extensions=None):
    if extensions is None:
        extensions = {'.cj'}
    
    folder = Path(folder_path)
    if not folder.exists() or not folder.is_dir():
        return

    for file_path in folder.rglob("*"):
        if file_path.is_file() and file_path.suffix.lower() in extensions:
            process_file(file_path)

if __name__ == "__main__":
    main("/home/zhuguoqian/test_dev_tmp/cangjie_test/testsuites/HLT/API/std/ast/orgName/", extensions={'.cj'})