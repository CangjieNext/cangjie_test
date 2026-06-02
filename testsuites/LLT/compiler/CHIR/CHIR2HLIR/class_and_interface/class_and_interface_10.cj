// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class COO {
    public func foo(x: Int64) {
        return x
    }
    public var res = 5
    public init() {
        var a = foo(11)
        res = a
    }
}

main() {
    COO().res - 11
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
