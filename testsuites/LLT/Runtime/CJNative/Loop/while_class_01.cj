// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class A {
    public var a: Int32 = 1
    public func test(): Int32 {
        return a
    }
}

main(): Int64 {
    var b = 10
    while (b != 0) {
        var a = A()
        a.test()
        b--
    }
    return b
}
