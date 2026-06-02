// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class A {
    public var a: Int64 = 1
    public operator func [](vv: Int64, value!: Int64): Unit {
        a += value
    }
    public operator func [](vv: Int64): Int64 {
        a
    }
}

main() {
    var a = A()
    a[0] += 3
    if (a.a != 5) {
        return 1
    }
    return 0
}
