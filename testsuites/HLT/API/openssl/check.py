import os
import subprocess
import sys
import re
from typing import *

# OpenSSL存在一部分符号不被仓颉侧封装，该部分符号使用白名单来管理
# 未来仓颉可能新增封装OpenSSL符号，新增的符号将不存在于该白名单中，如果存在问题则将导致报错
white_list: Set[str] = [

]

class Symbol:
    def __init__(self, file_name: str, symbol_type: str, symbol_name: str):
        self.file_name = file_name
        self.symbol_type = symbol_type
        self.symbol_name = symbol_name

def main() -> None:
    target = sys.argv[1]
    library_file_path = sys.argv[2]
    if not os.path.exists(library_file_path):
        print('file does not exist: {}'.format(library_file_path))
        sys.exit(1)
    result = subprocess.run(['nm', '-A', library_file_path], capture_output=True, text=True, check=True)
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
    if len(symbol_list) == 0:
        print(f'no symbol found in {library_file_path}')
        exit(1)
    
    # 开始检查算法
    check_pass = True
    l = {
        'darwin_aarch64_cjnative',
        'darwin_x86_64_cjnative',
        'ios_aarch64_cjnative',
        'ios_simulator_aarch64_cjnative',
        'ios_simulator_x86_64_cjnative',
    }
    prefix = '_DYN' if target in l else 'DYN_'
    # print(f'prefix = {prefix}')
    for symbol in symbol_list:
        if symbol.symbol_type == 'U' and symbol.symbol_name.startswith(prefix):
            m = re.match(f'^{prefix}(.+)$', symbol.symbol_name)
            assert m
            name = m.group(1)
            # 查找是否存在对应U符号
            # print(f'finding {name}')
            find_result = [s for s in symbol_list if s.symbol_type == 'U' and s.symbol_name == name]

            # 预期找到有且仅有一个对应符号
            if len(find_result) == 0:
                # 如果在白名单中，则不认为是问题
                if symbol.symbol_name in white_list:
                    print(f'no corresponding symbol but in white list: {symbol.symbol_name}')
                    continue
                print(f'no corresponding symbol: {symbol.symbol_name}')
                check_pass = False
            elif len(find_result) == 1:
                print(f'symbol check pass: {symbol.symbol_name}')
                continue
            else:
                print(f'more than one corresponding symbol: {symbol.symbol_name}')
                check_pass = False
    
    if check_pass:
        sys.exit(0)
    else:
        sys.exit(1)


if __name__ == '__main__':
    main()
