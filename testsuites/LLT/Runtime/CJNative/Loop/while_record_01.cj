// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

struct A {
    public var a0: Int8 = 1
    public var a1: Int16 = 1
    public var a2: Int32 = 1
    public var a3: Int64 = 1
}

main(): Int64 {
    var b: Int32 = 100
    var a: A = A()
    while (b > 0) {
        a.a2 = b
        b--
    }
    if (a.a2 == 1) {
        return 0
    }
    return 1
}
