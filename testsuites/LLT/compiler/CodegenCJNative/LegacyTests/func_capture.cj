// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func codegenUnitTest(): Int32 {
    let a: Int32 = 1
    let b: Int32 = 10
    let c: Int32 = 100
    func foo1(): Int32 {
        func foo2(): Int32 {
            return b
        }
        return c + foo2()
    }
    func foo(): Int32 {
        return a + foo1()
    }
    return foo()
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 111) {
        return 0
    } else {
        return -1
    }
}
