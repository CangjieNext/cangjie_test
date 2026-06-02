// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var val = 2

interface A {
    mut prop b: Int64 {
        get() {
            val
        }
        set(v) {
            val = v
        }
    }
}

class C <: A {}

interface B <: A {
    mut prop b: Int64 {
        get() {
            val
        }
        set(v) {
            val = v + 1
        }
    }
}

class D <: B {}

main(): Int64 {
    var c = C()
    c.b = 4
    if (c.b != 4) {
        return 1
    }

    var d = D()
    d.b = 3
    if (d.b != 4) {
        return 1
    }

    return 0
}
