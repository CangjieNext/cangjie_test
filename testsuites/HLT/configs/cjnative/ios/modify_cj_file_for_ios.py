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

func_cj_main = "func cj_main"
cangjie_main_start = """
@C
public func cangjie_main(): Unit {
    var ret = 1
    try {
"""
call_cj_main_Int = "\n        ret = cj_main()"
call_cj_main_Unit = "\n        cj_main()\n        ret = 0"
call_cj_ut_start = """\n        let testPackage = TestPackage(@sourcePackage())"""
call_cj_ut_pref = "\n        testPackage.registerSuite({ => "
call_cj_ut_suff = "().asTestSuite() })"
call_cj_ut_end = "\n        ret = entryMain(testPackage)\n        if (ret != 0) { ret = 1 }"
cangjie_main_end = """
    } catch (e: Exception) {
        ret = 1
        e.printStackTrace()
    } finally {
        print("cj_main_return_start${ret}cj_main_return_end")
    }
}"""


def print_log(str):
    if IS_DEBUG:
        print(str)


def has_return_statement(func_body: str) -> bool:
    """检测函数体内是否包含非Unit的return语句"""
    # 排除 return Unit 和 return@label 的情况
    clean_body = re.sub(r'//.*?$|/\*.*?\*/|".*?"', '', func_body, flags=re.DOTALL)
    return bool(re.search(r'\breturn\b(?!\s*Unit\b)(?!\s*@)', clean_body))


def modify(data):
    pattern_cangjie_main = r'(^\s*.*\s*func\s*cangjie_main\s*\(\)\s*:?\s*.*\s*\{)'
    if re.search(pattern_cangjie_main, data, re.M):
        raise Exception("[错误] 已存在 cangjie_main 函数")

    modified = data + cangjie_main_start
    pattern_main = r'(^\s*main\s*\(\)\s*(?::\s*([^\s\{]+)\s*)?\{)'
    matches_main = re.findall(pattern_main, data, re.M)

    if len(matches_main) > 1:
        raise Exception(f"[错误] 匹配到 {len(matches_main)} 个 main 函数")
    elif len(matches_main) == 1:
        replaced, return_type = matches_main[0]
        print_log(f"匹配的 main 函数: {repr(replaced)}")
        print_log(f"返回类型: {repr(return_type)}")

        # 获取函数体内容
        func_start = data.find(replaced) + len(replaced)
        func_end = data.find("\n}", func_start)
        func_body = data[func_start:func_end]

        # 判断返回值处理方式
        need_return = (
                (return_type and "Int" in return_type) or
                (not return_type and has_return_statement(func_body))
        )

        modified = modified.replace(replaced, replaced.replace("main", func_cj_main))
        modified += call_cj_main_Int if need_return else call_cj_main_Unit
    else:
        pattern_unittest = r"^\s*@Test\s*(?:public)?\s*class\s*(.*?)\s*{$"
        matches = re.findall(pattern_unittest, data, re.M)
        if len(matches) < 1:
            raise Exception(f"[错误] 未找到 main 或 @Test, 无法处理")
        modified += call_cj_ut_start
        for idx, ut_class_name in enumerate(matches, 1):
            modified += call_cj_ut_pref + ut_class_name + call_cj_ut_suff
        modified += call_cj_ut_end

    return modified + cangjie_main_end


def process_file(input_path, output_path):
    try:
        # 读取原始文件内容
        with open(input_path, 'r', encoding='utf-8') as f:
            original_data = f.read()
        # 修改数据
        modified_data = modify(original_data)
        # 写入输出文件
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(modified_data)

        print_log(f"文件处理成功，输出路径：{output_path}")
    except FileNotFoundError:
        raise Exception(f"[错误] 输入文件不存在：{input_path}")
    except Exception as e:
        raise Exception(f"[错误] 处理失败：{str(e)}")


def main():
    parser = argparse.ArgumentParser(
        description="处理 cj 文件以满足 cangjie ios 测试",
        formatter_class=argparse.RawTextHelpFormatter
    )
    parser.add_argument('input', help='输入文件路径')
    parser.add_argument('-o', '--output', required=True, help='输出文件路径')
    parser.add_argument("--ignore-exception", action="store_true", help="忽略异常继续执行")
    args = parser.parse_args()
    global IS_DEBUG
    IS_DEBUG = False if args.ignore_exception else True

    process_file(args.input, args.output)


if __name__ == '__main__':
    try:
        main()
    except Exception as e:
        print_log(str(e))
        sys.exit(255 if IS_DEBUG else 0)