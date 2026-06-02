// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

open class A {}

class B <: A {}

func assert(input: B): Int64 {
    return 1
}

func test(): Int64 {
    var i: A = A()
    var res = match (i) {
        case a: B => assert(a)
        case _ => 2
    }
    if (res == 2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return test()
}
