// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

struct A {
    var a0: Int64 = 6
    let a1: Int64 = 7
    static var a2: Int64 = 9
    static func g(): Int64 {
        a2 = 3
        var b = a2
        func g1() {
            a2 = 4
            var b1 = a2
            func g2() {
                a2 = 6
                return a2
            }
            return b1 + g2()
        }

        return a2 + g1()
    }
}

main(): Int64 {
    var struct1 = A()
    if (A.g() != 13) {
        return 1
    }
    return 0
}
