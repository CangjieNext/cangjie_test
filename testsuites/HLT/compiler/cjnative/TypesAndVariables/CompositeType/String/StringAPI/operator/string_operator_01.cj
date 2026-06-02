/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s1: String = "hello char lang"
    var chs = [r'h', r'e', r'l', r'l', r'o', r' ', r'c', r'h', r'a', r'r', r' ', r'l', r'a', r'n', r'g']
    var s2 = String(chs)
    var s3 = "hello char lang \u{5324}"
    var s4 = s1[0..5]

    var res1 = s1 != s2 //  false
    var res2 = s3 != "hello char lang \u{5324}" //  false
    var res3 = "hello char lang \u{5324}" != s3 //  false
    var res4 = "hello" != s4 //  false
    var res5 = "" != String() //  false
    var res6 = "  " != "  " //  false
    var res7 = "a\n" != """
a
"""
    var res8 = "a\\n" != #"a\n"#

    if (res1 || res2 || res3 || res4 || res5 || res6 || res7 || res8) {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
