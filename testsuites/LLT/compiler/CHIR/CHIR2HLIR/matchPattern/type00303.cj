// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class A {}

func test(): Int64 {
    var i: A = A()
    var res = match (i) {
        case _: A => 5
        case _ => 0
    }
    if (res != 5) {
        return 1
    }
    return 0
}

main(): Int64 {
    return test()
}
