// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

let s1 = """
"""
let s2 = """
Hello,
    CangJie!"""

main(): Int64 {
    if (s1 != "") {
        return 1
    }
    if (s2 != "Hello,\n    CangJie!") {
        return 1
    }
    return 0
}
