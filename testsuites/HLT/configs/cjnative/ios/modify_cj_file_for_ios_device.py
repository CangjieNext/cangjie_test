#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import argparse
import re
import sys
import os
from pathlib import Path
from typing import *
import time

func_cj_main = "func cj_main"
cangjie_main_start = "\n@C\npublic func cangjie_main(): Unit {\nvar ret = 0\ntry{"
call_cj_main_Int = "\n    ret = cj_main()"
call_cj_main_Unit = "\n    cj_main()"
call_cj_ut_start = """\n    let testPackage = TestPackage(@sourcePackage())"""
call_cj_ut_pref = "\n    testPackage.registerSuite({ => "
call_cj_ut_suff = "().asTestSuite() })"
call_cj_ut_end = "\n    ret = entryMain(testPackage)"
cangjie_main_end = """
    } catch (e: Exception) {
        ret = 1
        e.printStackTrace()
    } catch (e: Error) {
        ret = 1
        e.printStackTrace()
    } finally {
        println()
        println("cj_main_return_start${ret}cj_main_return_end")
        println(@sourceFile())
    }
}"""

def print_log(str):
    if IS_DEBUG:
        print(str)

def modify_main(data):
    lines = data.splitlines()
    cangjie_main = cangjie_main_start
    result = ""
    for line in lines:
        pattern_main = r'(^\s*main\s*\(\s*(.*?)\s*\)\s*:?\s*(.*?)\s*\{)(?!\})'
        pattern_unsafe_main = r'(^\s*unsafe\s*main\s*\(\s*(.*?)\s*\)\s*:?\s*(.*?)\s*\{)(?!\})'
        matches_main = re.findall(pattern_main, line, re.M)
        matches_unsafe_main = re.findall(pattern_unsafe_main, line, re.M)
        if len(matches_main) != 0:
            replaced = matches_main[0][0]
            return_type = matches_main[0][2]
            line = line.replace(replaced, replaced.replace("main", func_cj_main))
            if "Int" in return_type: # if return_type in ["Int8", "Int16", "Int32", "Int64"]:
                cangjie_main += call_cj_main_Int
            elif not return_type or return_type == "Unit":
                cangjie_main += call_cj_main_Unit
            else:
                raise Exception(f"[错误] 无法处理的 main 函数返回值类型: '{return_type}'")
        # 直接复制一份上面的main的情况，以后再优化
        if len(matches_unsafe_main) != 0:
            replaced = matches_unsafe_main[0][0]
            return_type = matches_unsafe_main[0][2]
            line = line.replace(replaced, replaced.replace("main", func_cj_main))
            if "Int" in return_type: # if return_type in ["Int8", "Int16", "Int32", "Int64"]:
                cangjie_main += call_cj_main_Int
            elif not return_type or return_type == "Unit":
                cangjie_main += call_cj_main_Unit
            else:
                raise Exception(f"[错误] 无法处理的 main 函数返回值类型: '{return_type}'")
        result += line + "\n"
    return result + cangjie_main

def modify(data):
    pattern_cangjie_main = r'(^\s*.*\s*func\s*cangjie_main\s*\(\)\s*:?\s*.*\s*\{)'
    matches_cangjie_main = re.findall(pattern_cangjie_main,  data, re.M)
    if len(matches_cangjie_main) > 0:
        raise Exception(f"[错误] 已存在 {matches_main_num} 个 cangjie_main 函数 : {matches_cangjie_main}")
    modified = data + cangjie_main_start
    pattern_main = r'(^\s*main\s*\(\s*(.*?)\s*\)\s*:?\s*(.*?)\s*\{)(?!\})'
    pattern_unsafe_main = r'(^\s*unsafe\s*main\s*\(\s*(.*?)\s*\)\s*:?\s*(.*?)\s*\{)(?!\})'
    matches_main = re.findall(pattern_main, data, re.M)
    matches_unsafe_main = re.findall(pattern_unsafe_main, data, re.M)
    matches_main_num = len(matches_main)
    matches_unsafe_main_num = len(matches_unsafe_main)
    if matches_main_num + matches_unsafe_main_num > 1:
        raise Exception(f"[错误] 匹配到 {matches_main_num} 个 main 函数 : {matches_main}")
    elif matches_main_num + matches_unsafe_main_num == 1:
        modified = modify_main(data)
    else:
        pattern_unittest = r"^\s*@Test\s*(?:public)?\s*class\s*(.*?)\s*{$"
        matches = re.findall(pattern_unittest,  data, re.M)
        if len(matches) < 1:
            raise Exception(f"[错误] 未找到 main 或 @Test, 无法处理")
        modified += call_cj_ut_start
        for idx, ut_class_name in enumerate(matches, 1):
            modified += call_cj_ut_pref + ut_class_name + call_cj_ut_suff
        modified += call_cj_ut_end
    return modified + cangjie_main_end


# 根据info文件找到真正的入口main所在的那个文件的路径
def process_info_file(test_info_file_path: Path) -> Path:
    items: List[Path] = list()
    with open(test_info_file_path, 'r', encoding='utf-8') as f:
        for line in f.readlines():
            print(line)
            pattern_dependence = r'^\s*//\s*DEPENDENCE\s*:\s*(.+)'
            matches_dependence = re.search(pattern=pattern_dependence, string=line, flags=re.IGNORECASE)
            if matches_dependence:
                print('!')
                content = matches_dependence.group(1).strip()
                l = re.split(r'[,\s]+', content)
                for i in l:
                    items.append(Path(i))
                # 一般一个info文件中只会有一个DEPENDENCE声明，找到第一个处理完后就可以不往下看了
                break
            else:
                print('...')
                # 该行没有DEPENDENCE，继续看下一行
                pass
                
    print(items)
    # 逐个文件打开确认是否包含main
    pattern_main = r'(\s*main\s*\(\s*(.*?)\s*\)\s*:?\s*(.*?)\s*\{)(?!\})'
    for dependent_file_path in items:
        with open(dependent_file_path, 'r', encoding='utf-8') as f:
            content = f.read()
            if re.findall(pattern_main, content):
                # 找到main了，就是他
                return dependent_file_path
    
    raise Exception(f"[ERROR] 没找到拥有main的源文件")


def process_file(input_path: Path, output_path: Path) -> None:
    # 需要判断输入文件是否是info文件，如果是info文件的话，需要读取DEPENDENCE信息来找到真正的用例入口
    ext = input_path.suffix
    entry_source_file_path = Path()
    if ext == '.info':
        # 确认好哪个源文件中包含main后，采用相同流程处理这个包含main的源文件
        entry_source_file_path = process_info_file(input_path)
    elif ext == '.cj':
        entry_source_file_path = input_path
    else:
        raise Exception(f'[ERROR] Supported file type with suffix \"{ext}\"')
    try:
        # 读取原始文件内容
        with open(entry_source_file_path, 'r', encoding='utf-8') as f:
            original_data = f.read()
        # 修改数据
        modified_data = modify(original_data)
        # 写入输出文件
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(modified_data)
        print_log(f"文件处理成功，输出路径：{output_path}")
    except FileNotFoundError:
        raise Exception(f"[错误] 输入文件不存在：{entry_source_file_path}")
    except Exception as e:
        raise Exception(f"[错误] 处理失败：{str(e)}")

def main():
    parser = argparse.ArgumentParser(
        description="处理 cj 文件以满足 cangjie ios 测试",
        formatter_class=argparse.RawTextHelpFormatter
    )
    parser.add_argument('input', help='输入文件路径')
    parser.add_argument('-o', '--output', required=True, help='输出文件路径')
    parser.add_argument("--ignore-exception", action="store_true", help="Uninstall app after running")
    args = parser.parse_args()
    global IS_DEBUG
    IS_DEBUG = False if args.ignore_exception else True

    process_file(Path(args.input), Path(args.output))

if __name__ == '__main__':
    try:
        main()
        time.sleep(60)
    except Exception as e:
        print_log(str(e))
        sys.exit(255 if IS_DEBUG else 0)