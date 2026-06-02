// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0

// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

extend UInt64 {
    public static func foo() {
        return 1
    }

    public func me() {
        return foo()
    }
    prop a: Int64 {
        get() {
            0
        }
    }
}

main(): Int64 {
    var t = UInt64(1).me
    UInt64.foo
    UInt64(1).a
    return 0
}
