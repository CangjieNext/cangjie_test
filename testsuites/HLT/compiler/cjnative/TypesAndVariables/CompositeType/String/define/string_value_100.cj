/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan zzzz\nzzzz\nzzzzxxxx\n    xxxx\n    xxxx\n        xxxx    yyyy\n    yyyy\n        yyyy

main(): Int64 {
    return run()
}

func run(): Int64 {
    foo()
    return 0
}

func foo(): Int64 {
    var s0: String = """
zzzz
zzzz
zzzz""" //
    var s1: String = """
xxxx
    xxxx
    xxxx
        xxxx"""
    var s2: String = """
    yyyy
    yyyy
        yyyy""" // 同时删除（所有行）左侧短公共空白字符(如果三个双引号单独出现在 一行，其所在行的空白字符不参与比较)。
    print(s0)
    print(s1)
    print(s2 + "\n")
    return 0
}
