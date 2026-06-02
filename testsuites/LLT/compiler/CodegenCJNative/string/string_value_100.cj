// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix %run_args 2>&1 | compare %f
// ASSERT: scan-begin zzzz
// ASSERT: scan-next zzzz
// ASSERT: scan-next zzzzxxxx
// ASSERT: scan-next     xxxx
// ASSERT: scan-next     xxxx
// ASSERT: scan-next         xxxx    yyyy
// ASSERT: scan-next    yyyy
// ASSERT: scan-next        yyyy

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
        yyyy""" //
    print(s0)
    print(s1)
    print(s2 + "\n")
    return 0
}
