// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

var val = 3

enum A {
    A1

    public prop b: Int64 {
        get() {
            1
        }
    }
    public func f() {
        2
    }
}

main(): Int64 {
    var a = A1.f()
    var b = A1.b
    if (a != 2 || b != 1 || val != 3) {
        return 1
    }
    return 0
}
