// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

struct K {
    public var a = 6
    public let b = 2
    public init() {}
    public func f() {
        func f1(l!: Int64 = this.a) {
            var c = this.a
            func f2() {
                return this.b
            }
            return c + a + f2()
        }
        return f1()
    }
}

main(): Int64 {
    var x1 = K()
    x1.a = 2
    if (K().f() != 14 || x1.a != 2) {
        return 1
    }
    return 0
}
