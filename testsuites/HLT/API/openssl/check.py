import os
import subprocess
import sys
import re
from typing import *

class Symbol:
    def __init__(self, file_name: str, symbol_type: str, symbol_name: str):
        self.file_name = file_name
        self.symbol_type = symbol_type
        self.symbol_name = symbol_name

def main() -> None:
    stdx_static_library_file_path = sys.argv[1]
    if not os.path.exists(stdx_static_library_file_path):
        print('file does not exist: {}'.format(stdx_static_library_file_path))
        sys.exit(1)
    result = subprocess.run(['nm', '-A', stdx_static_library_file_path], capture_output=True, text=True, check=True)
    symbol_list: List[Symbol] = []
    for line in result.stdout.split('\n'):
        # 带有偏移量的情况
        m = re.match(r'^(.+?):\s+[0-9a-fA-F]+\s+([a-zA-Z?])\s+(.+)$', line)
        if m:
            symbol = Symbol(file_name=m.group(1).strip(), symbol_type=m.group(2).strip(), symbol_name=m.group(3).strip())
            symbol_list.append(symbol)
        # 不带有偏移量的情况
        m = re.match(r'^(.+?):\s+([a-zA-Z?])\s+(.+)$', line)
        if m:
            symbol = Symbol(file_name=m.group(1).strip(), symbol_type=m.group(2).strip(), symbol_name=m.group(3).strip())
            symbol_list.append(symbol)
    
    # 断言至少存在一个以上的符号
    assert len(symbol_list) > 0
    
    # 开始检查算法
    for symbol in symbol_list:
        if symbol.symbol_type == 'U' and symbol.symbol_name.startswith('_DYN'):
            m = re.match(r'^_DYN_(.+)$', symbol.symbol_name)
            assert m
            name = m.group(1)
            print('found {}'.format(name))

if __name__ == '__main__':
    main()
