// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

struct A {
    public var a: Int64 = 1
    public let b: Int64 = 2
    public func f() {
        func f1() {
            var c = {=> this.a + this.b}
            return c()
        }
        var d = {=> this.b + f1()}
        return d()
    }
}

main() {
    if (A().f() != 5) {
        return 1
    }
    return 0
}
