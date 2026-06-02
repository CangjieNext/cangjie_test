// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: %n.c
// EXEC: %clang -c %n.c -o %n.o
// EXEC: %compiler %cmp_opt %n.cj %n.o -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

foreign func native_entry(c: Int32): Int32

func ark_entry(a: Int32, b: Int32): Int32 {
    unsafe { return native_entry(a + b) }
}

func codegenUnitTest(): Int32 {
    return ark_entry(40, 2)
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 4200) {
        return 0
    } else {
        return -1
    }
}
